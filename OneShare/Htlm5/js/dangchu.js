/*Javascript代码片段*/
    var end, startOp, currentOp, increase, canvas, ctx;

    window.onload = function(){
      width = window.screen.width;
      height =  100;

      if (canvas = document.getElementById("MyCanvas")) {
        canvas = document.getElementById("MyCanvas");
      } else if(canvas = document.getElementById("MyJianJie")) {
        canvas = document.getElementById("MyJianJie")
      } else if(canvas = document.getElementById("MyZuJi")) {
        canvas = document.getElementById("MyZuJi")
      }
      canvas.width = width;
      canvas.height = height;

      ctx = canvas.getContext("2d");
      window.requestAnimFrame = (function(callback) {
        return window.requestAnimationFrame || 
                window.webkitRequestAnimationFrame || 
                   window.mozRequestAnimationFrame || 
                      window.oRequestAnimationFrame || 
                        window.msRequestAnimationFrame ||
          function(callback) {
            window.setTimeout(callback, 1000);
          };
      })();

      
      function init(){
        // 设置最初的变量
        end = 0.8; 
        startOp = 0.0;
        currentOp;
        increase = 0.005;
        currentOp = startOp;

        // 把原点放到中间，便于定位
        ctx.translate(width/2, height/2);
        ctx.textBaseline = "middle";
        ctx.textAlign = "center";
        ctx.font = "1em STKaiti";
        window.requestAnimFrame(start);
      }

      init();
    }

    function start (){
      currentOp += increase;
      if(currentOp < end || currentOp > startOp) {
        ctx.fillStyle="rgba(255, 255, 255, " + currentOp + ")";
        ctx.clearRect(-width/2, -height/2, width, height); // 清空画布
        if (canvas = document.getElementById("MyCanvas")) {
        ctx.fillText("M s . W a n g", 0, 0);
      } else if(canvas = document.getElementById("MyJianJie")) {
        ctx.fillText("我 的 简 介", 0, 0);
      } else if(canvas = document.getElementById("MyZuJi")) {
        ctx.fillText("我 的 足 迹", 0, 0);
      }
        window.requestAnimFrame(start);
      }
    }
