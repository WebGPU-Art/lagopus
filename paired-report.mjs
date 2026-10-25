import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
const cli=process.env.REVIEW_CALCIT_BIN??'calcit';
const exec=(name,args)=>execFileSync(name,args,{encoding:'utf8',maxBuffer:64e6,stdio:['pipe','pipe','pipe']});
const norm=v=>Array.isArray(v)?v.map(norm):v&&typeof v==='object'?Object.fromEntries(Object.entries(v).map(([k,x])=>[k,k==='__edn_set'?x.map(norm).sort((a,b)=>JSON.stringify(a).localeCompare(JSON.stringify(b))):norm(x)])):v;
const query=(...args)=>{const r=JSON.parse(exec(cli,['calcit.cirru','query',...args,'--format','json']));assert.ok(!r.diagnostics?.some(d=>d.severity==='error'));return norm(r.data);};
const blob=()=>exec('git',['hash-object','calcit.cirru']).trim();
function views(){
 const namespaces=query('ns').namespaces,defs=[],ns=[];
 for(const name of namespaces){
  const info=query('ns',name);ns.push(info);
  const names=exec(cli,['calcit.cirru','query','defs',name]).split('\n').filter(l=>/^  \S/.test(l)).map(l=>l.trim().split(' ')[0]);
  assert.equal(names.length,info.definition_count);
  for(const d of names)defs.push(query('def',name+'/'+d));
 }
 return {config:query('config'),namespaces:ns,defs};
}
const [mode,version]=process.argv.slice(2);
if(mode==='inventory'){
 const old=blob(),before=views();assert.equal(blob(),old);
 writeFileSync('paired-reviewed.json',JSON.stringify({sourceCommit:exec('git',['rev-parse','HEAD']).trim(),snapshotBlob:old,before,manifests:Object.fromEntries(['deps.cirru','package.json','.yarnrc.yml','yarn.lock'].map(f=>[f,readFileSync(f,'utf8')]))}));
 console.log(JSON.stringify({snapshotBlob:old,definitions:before.defs.length,namespaces:before.namespaces.length,tests:before.defs.reduce((n,d)=>n+d.tests.length,0)}));
}else{
 assert.equal(process.env.GITHUB_ACTIONS,'true');assert.equal(process.platform,'linux');
 const p=norm(JSON.parse(readFileSync('paired-reviewed.json','utf8')));assert.equal(p.sourceCommit,'73c21542c5f50fba1060c5dee80fea52febc210c');
 if(mode!=='after')assert.equal(blob(),p.snapshotBlob);
 assert.ok(['0.30.1','0.31.0-alpha.4'].includes(version));
 mkdirSync('acceptance',{recursive:true});
 if(mode==='pair'){
  for(const [f,s]of Object.entries(p.manifests))assert.equal(readFileSync(f,'utf8'),s);
  const old=':calcit-version |0.30.1-alpha.5';assert.equal(p.manifests['deps.cirru'].split(old).length,2);
  writeFileSync('deps.cirru',p.manifests['deps.cirru'].replace(old,':calcit-version |'+version));
  const pkg=JSON.parse(p.manifests['package.json']);assert.equal(pkg.dependencies['@calcit/procs'],'0.30.1-alpha.5');pkg.dependencies['@calcit/procs']=version;writeFileSync('package.json',JSON.stringify(pkg,null,2)+'\n');
 }else if(mode==='apply'){
  assert.equal(exec(cli,['-v']).trim(),version);assert.deepEqual(views(),p.before);
  const expected=structuredClone(p.before),ops=[],tests=new Map();
  assert.equal(p.migration.sites.length,13);
  for(const s of p.migration.sites){
   const d=expected.defs.find(d=>d.id===s.id),t=s.region==='test'?d.tests.find(t=>t.name===s.testName):null;
   const tree=t?t.code:d.code,node=s.path.reduce((v,i)=>v[i],tree);assert.deepEqual(node,s.before);
   assert.ok(['atom','defatom'].includes(node[0]));const next=node[0]==='atom'?'ref':'defref';
   assert.deepEqual(s.after,[next,...node.slice(1)]);node[0]=next;
   if(t)tests.set(s.id+'|'+s.testName,{id:s.id,test:t});
   else ops.push(['tree','replace',s.id,'--path','@'+[...s.path,0].join('.'),'--input-format','json-ast','--code',JSON.stringify(next)]);
  }
  assert.deepEqual(expected,p.migration.expected);
  for(const{id,test}of tests.values())ops.push(['edit','add-test',id,test.name,'--tags',test.tags.join(','),'--input-format','json-ast','--code',JSON.stringify(test.code),'--overwrite']);
  writeFileSync('acceptance/operations.json',JSON.stringify(ops));
  const txn=['calcit.cirru','edit','transaction','--file','acceptance/operations.json','--format','json'];
  const preview=JSON.parse(exec(cli,[...txn,'--dry-run']));assert.ok(preview.scoped_revision);writeFileSync('acceptance/preview.json',JSON.stringify(preview));
  writeFileSync('acceptance/applied.json',exec(cli,[...txn,'--expect-revision',preview.scoped_revision]));
  assert.deepEqual(views(),expected);writeFileSync('acceptance/modified-blob.txt',blob());
 }else{
  assert.ok(['before','after'].includes(mode));assert.equal(exec(cli,['-v']).trim(),version);
  const expectedPkg=JSON.parse(p.manifests['package.json']);expectedPkg.dependencies['@calcit/procs']=version;
  assert.deepEqual(JSON.parse(readFileSync('package.json','utf8')),expectedPkg);
  assert.equal(readFileSync('deps.cirru','utf8'),p.manifests['deps.cirru'].replace(':calcit-version |0.30.1-alpha.5',':calcit-version |'+version));
  const normalizeLock=s=>s.split('\n\n').map(b=>b.startsWith('"@calcit/procs@npm:')?b.replace(/^  checksum:.*$/m,'  checksum: runtime-checksum'):b).join('\n\n');
  assert.equal(normalizeLock(readFileSync('yarn.lock','utf8').replaceAll(version,'0.30.1-alpha.5')),normalizeLock(p.manifests['yarn.lock']));
  const actual=views(),expected=mode==='after'?p.migration.expected:p.before;
  assert.deepEqual(actual,expected);assert.equal(blob(),mode==='after'?readFileSync('acceptance/modified-blob.txt','utf8'):p.snapshotBlob);
  assert.equal(readFileSync('.yarnrc.yml','utf8'),p.manifests['.yarnrc.yml']);
  writeFileSync('acceptance/'+mode+'.json',JSON.stringify(actual));
  writeFileSync('acceptance/source-evidence.json',JSON.stringify({version,sourceCommit:p.sourceCommit,beforeBlob:p.snapshotBlob,afterBlob:blob(),completeViewsMatchExpected:true,reviewedSites:p.migration.sites.length,definitions:actual.defs.length,tests:actual.defs.reduce((n,d)=>n+d.tests.length,0)}));
 }
}
