const iconMenu = document.querySelector('.icon-menu');

iconMenu.addEventListener('click',function(){

    document.getElementById('sidebar').classList.toggle('active');

});

// document.querySelectorAll("sidebar .icon-menu").forEach(el=>{
//     el.addEventListener("click",function(ev){

//         ev.stopPropagation();
//         this.parentNode.classList.add("active");
//     })
// })

// document.querySelectorAll("body").forEach(el=>{
//     el.addEventListener("click",function(ev){
//         ev.stopPropagation();
//         this.parentNode.classList.add("active");
//     })
// })

// function openNav() {
//     document.getElementById("mySidenav").style.width = "250px";
//     document.getElementById("main").style.marginLeft = "250px";
//     document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
// }

// function closeNav() {
//     document.getElementById("mySidenav").style.width = "0";
//     document.getElementById("main").style.marginLeft= "0";
//     document.body.style.backgroundColor = "white";
// }


