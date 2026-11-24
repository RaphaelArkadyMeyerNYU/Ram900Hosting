/* One video, no seeking, and at most one pending navigation command. */
const clips=window.TALK||[];
const stage=document.querySelector('#stage');
const video=document.querySelector('#clip');
const held=document.querySelector('#held');
const message=document.querySelector('#message');
const counter=document.querySelector('#counter');
let index=-1,phase='idle',pending=null,generation=0;
const slideNumbers=[...new Set(clips.map(c=>c.slide))];
function state(value){phase=value;stage.dataset.state=value;stage.dataset.pending=pending?.kind||''}
function holdFrame(){
  if(video.readyState>=2&&video.videoWidth){
    held.width=video.videoWidth;held.height=video.videoHeight;
    held.getContext('2d').drawImage(video,0,0,held.width,held.height);
  }
  held.hidden=false;video.style.visibility='hidden';
}
function start(i){
  if(i<0||i>=clips.length)return;
  const token=++generation;
  holdFrame();video.pause();index=i;state('loading');
  video.dataset.clip=String(i);video.dataset.scene=clips[i].scene;video.dataset.beat=clips[i].beat;
  counter.textContent='Slide '+clips[i].slide+' / '+Math.max(...slideNumbers)+' · '+clips[i].beat;
  video.onended=()=>{
    if(token!==generation)return;
    state('idle');
    const next=pending;pending=null;stage.dataset.pending='';
    if(clips[index].chain){
      if(next&&next.kind!=='next')perform(next);else start(index+1);
    }else if(next)perform(next);
  };
  video.onerror=()=>{if(token!==generation)return;state('idle');message.textContent='Could not load this clip. Press R to retry.'};
  video.onloadeddata=()=>{
    if(token!==generation)return;
    video.onloadeddata=null;
    const reveal=()=>{if(token!==generation)return;held.hidden=true;video.style.visibility='visible'};
    if(video.requestVideoFrameCallback)video.requestVideoFrameCallback(reveal);
    else video.addEventListener('playing',reveal,{once:true});
    state('playing');
    video.play().then(()=>{if(token===generation)message.textContent=''}).catch(()=>{
      if(token!==generation)return;state('idle');message.textContent='Click to start.';
    });
  };
  video.src=clips[i].file;video.load();
}
function perform(command){
  if(command.kind==='next')start(index+1);
  else if(command.kind==='previous'){
    let i=index-1;while(i>=0&&clips[i].chain)i--;start(i);
  }else if(command.kind==='home')start(0);
  else if(command.kind==='replay')start(Math.max(0,index));
  else if(command.kind==='slide'){
    const at=slideNumbers.indexOf(clips[index]?.slide??slideNumbers[0]);
    const number=slideNumbers[Math.max(0,Math.min(slideNumbers.length-1,at+command.delta))];
    start(clips.findIndex(c=>c.slide===number));
  }
}
function request(command){
  if(phase!=='idle'){pending=command;stage.dataset.pending=command.kind;return}
  perform(command);
}
stage.addEventListener('click',event=>{if(!event.target.closest('#help'))request({kind:'next'})});
document.addEventListener('keydown',event=>{
  const key=event.key;
  if([' ','ArrowRight','ArrowLeft','PageDown','PageUp','Home'].includes(key))event.preventDefault();
  if(event.repeat)return;
  if(key===' '||key==='ArrowRight')request({kind:'next'});
  else if(key==='ArrowLeft')request({kind:'previous'});
  else if(key==='PageDown')request({kind:'slide',delta:1});
  else if(key==='PageUp')request({kind:'slide',delta:-1});
  else if(key==='Home')request({kind:'home'});
  else if(key.toLowerCase()==='r')request({kind:'replay'});
  else if(key.toLowerCase()==='f'){
    if(document.fullscreenElement)document.exitFullscreen();else document.documentElement.requestFullscreen();
  }else if(key==='?')document.querySelector('#help').classList.toggle('open');
  else if(key.toLowerCase()==='s')counter.classList.toggle('open');
});
let idle;
document.addEventListener('mousemove',()=>{document.body.classList.remove('idle');clearTimeout(idle);idle=setTimeout(()=>document.body.classList.add('idle'),2000)});
if(clips.length)start(0);else message.textContent='Build the presentation first.';
