        var interval;
        var pos = 0;
        window.onload = function() {
            var images = document.getElementsByTagName('img');
            var tab = document.getElementById("tab");
            tab.onmouseover = function() {
                clearInterval(interval);
            }
            tab.onmouseout = function() {
                run(images);
            }
            run(images);
        }
        var run = function(images) {
            interval = setInterval(function() {
                images[pos].style.display = 'none';
                pos = ++pos == images.length ? 0 : pos;
                images[pos].style.display = 'inline';
            }, 1000);
        }