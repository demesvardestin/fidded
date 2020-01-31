{"filter":false,"title":"pages.js","tooltip":"/app/assets/javascripts/pages.js","undoManager":{"mark":40,"position":40,"stack":[[{"start":{"row":0,"column":0},"end":{"row":34,"column":7},"action":"insert","lines":["let container = document.querySelector('.image-upload-card-body');","    let imageValue = document.querySelector('#image-value');","    let image = document.querySelector('#image');","    let actions = document.querySelector('#actions');","    ","    let readURL = (input) => {","        if (input.files && input.files[0]) {","            let reader = new FileReader();","            ","            reader.onload = function(e) {","                container.style.display = 'none';","                ","                image.style.display = 'block';","                image.style.width = '100%';","                image.style.height = 'auto';","                image.setAttribute('src', e.target.result);","                imageValue.value = e.target.result;","                ","                actions.style.display = 'block';","            }","            ","            reader.readAsDataURL(input.files[0]);","        }","    };","    ","    let cancelUpload = () => {","        image.style.display = 'none';","        actions.style.display = 'none';","        ","        container.style.display = 'block';","    };","    ","    $(\"#image-input\").change(function() {","        readURL(this);","    });"],"id":1}],[{"start":{"row":1,"column":0},"end":{"row":1,"column":4},"action":"remove","lines":["    "],"id":2},{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"remove","lines":["    "]},{"start":{"row":3,"column":0},"end":{"row":3,"column":4},"action":"remove","lines":["    "]},{"start":{"row":4,"column":0},"end":{"row":4,"column":4},"action":"remove","lines":["    "]},{"start":{"row":5,"column":0},"end":{"row":5,"column":4},"action":"remove","lines":["    "]},{"start":{"row":6,"column":0},"end":{"row":6,"column":4},"action":"remove","lines":["    "]},{"start":{"row":7,"column":0},"end":{"row":7,"column":4},"action":"remove","lines":["    "]},{"start":{"row":8,"column":0},"end":{"row":8,"column":4},"action":"remove","lines":["    "]},{"start":{"row":9,"column":0},"end":{"row":9,"column":4},"action":"remove","lines":["    "]},{"start":{"row":10,"column":0},"end":{"row":10,"column":4},"action":"remove","lines":["    "]},{"start":{"row":11,"column":0},"end":{"row":11,"column":4},"action":"remove","lines":["    "]},{"start":{"row":12,"column":0},"end":{"row":12,"column":4},"action":"remove","lines":["    "]},{"start":{"row":13,"column":0},"end":{"row":13,"column":4},"action":"remove","lines":["    "]},{"start":{"row":14,"column":0},"end":{"row":14,"column":4},"action":"remove","lines":["    "]},{"start":{"row":15,"column":0},"end":{"row":15,"column":4},"action":"remove","lines":["    "]},{"start":{"row":16,"column":0},"end":{"row":16,"column":4},"action":"remove","lines":["    "]},{"start":{"row":17,"column":0},"end":{"row":17,"column":4},"action":"remove","lines":["    "]},{"start":{"row":18,"column":0},"end":{"row":18,"column":4},"action":"remove","lines":["    "]},{"start":{"row":19,"column":0},"end":{"row":19,"column":4},"action":"remove","lines":["    "]},{"start":{"row":20,"column":0},"end":{"row":20,"column":4},"action":"remove","lines":["    "]},{"start":{"row":21,"column":0},"end":{"row":21,"column":4},"action":"remove","lines":["    "]},{"start":{"row":22,"column":0},"end":{"row":22,"column":4},"action":"remove","lines":["    "]},{"start":{"row":23,"column":0},"end":{"row":23,"column":4},"action":"remove","lines":["    "]},{"start":{"row":24,"column":0},"end":{"row":24,"column":4},"action":"remove","lines":["    "]},{"start":{"row":25,"column":0},"end":{"row":25,"column":4},"action":"remove","lines":["    "]},{"start":{"row":26,"column":0},"end":{"row":26,"column":4},"action":"remove","lines":["    "]},{"start":{"row":27,"column":0},"end":{"row":27,"column":4},"action":"remove","lines":["    "]},{"start":{"row":28,"column":0},"end":{"row":28,"column":4},"action":"remove","lines":["    "]},{"start":{"row":29,"column":0},"end":{"row":29,"column":4},"action":"remove","lines":["    "]},{"start":{"row":30,"column":0},"end":{"row":30,"column":4},"action":"remove","lines":["    "]},{"start":{"row":31,"column":0},"end":{"row":31,"column":4},"action":"remove","lines":["    "]},{"start":{"row":32,"column":0},"end":{"row":32,"column":4},"action":"remove","lines":["    "]},{"start":{"row":33,"column":0},"end":{"row":33,"column":4},"action":"remove","lines":["    "]},{"start":{"row":34,"column":0},"end":{"row":34,"column":4},"action":"remove","lines":["    "]}],[{"start":{"row":19,"column":9},"end":{"row":19,"column":10},"action":"insert","lines":[";"],"id":3}],[{"start":{"row":3,"column":49},"end":{"row":4,"column":0},"action":"insert","lines":["",""],"id":4},{"start":{"row":4,"column":0},"end":{"row":4,"column":1},"action":"insert","lines":["l"]},{"start":{"row":4,"column":1},"end":{"row":4,"column":2},"action":"insert","lines":["e"]},{"start":{"row":4,"column":2},"end":{"row":4,"column":3},"action":"insert","lines":["t"]}],[{"start":{"row":4,"column":3},"end":{"row":4,"column":4},"action":"insert","lines":[" "],"id":5}],[{"start":{"row":4,"column":4},"end":{"row":4,"column":5},"action":"insert","lines":["i"],"id":6},{"start":{"row":4,"column":5},"end":{"row":4,"column":6},"action":"insert","lines":["m"]},{"start":{"row":4,"column":6},"end":{"row":4,"column":7},"action":"insert","lines":["a"]},{"start":{"row":4,"column":7},"end":{"row":4,"column":8},"action":"insert","lines":["g"]},{"start":{"row":4,"column":8},"end":{"row":4,"column":9},"action":"insert","lines":["e"]}],[{"start":{"row":4,"column":9},"end":{"row":4,"column":10},"action":"insert","lines":["L"],"id":7},{"start":{"row":4,"column":10},"end":{"row":4,"column":11},"action":"insert","lines":["i"]},{"start":{"row":4,"column":11},"end":{"row":4,"column":12},"action":"insert","lines":["n"]},{"start":{"row":4,"column":12},"end":{"row":4,"column":13},"action":"insert","lines":["k"]},{"start":{"row":4,"column":13},"end":{"row":4,"column":14},"action":"insert","lines":["C"]},{"start":{"row":4,"column":14},"end":{"row":4,"column":15},"action":"insert","lines":["o"]},{"start":{"row":4,"column":15},"end":{"row":4,"column":16},"action":"insert","lines":["n"]},{"start":{"row":4,"column":16},"end":{"row":4,"column":17},"action":"insert","lines":["t"]},{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"insert","lines":["a"]},{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"insert","lines":["i"]},{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"insert","lines":["n"]},{"start":{"row":4,"column":20},"end":{"row":4,"column":21},"action":"insert","lines":["e"]},{"start":{"row":4,"column":21},"end":{"row":4,"column":22},"action":"insert","lines":["r"]}],[{"start":{"row":4,"column":22},"end":{"row":4,"column":23},"action":"insert","lines":[" "],"id":8},{"start":{"row":4,"column":23},"end":{"row":4,"column":24},"action":"insert","lines":["="]}],[{"start":{"row":4,"column":24},"end":{"row":4,"column":25},"action":"insert","lines":[" "],"id":9},{"start":{"row":4,"column":25},"end":{"row":4,"column":26},"action":"insert","lines":["d"]},{"start":{"row":4,"column":26},"end":{"row":4,"column":27},"action":"insert","lines":["o"]},{"start":{"row":4,"column":27},"end":{"row":4,"column":28},"action":"insert","lines":["c"]},{"start":{"row":4,"column":28},"end":{"row":4,"column":29},"action":"insert","lines":["u"]},{"start":{"row":4,"column":29},"end":{"row":4,"column":30},"action":"insert","lines":["m"]},{"start":{"row":4,"column":30},"end":{"row":4,"column":31},"action":"insert","lines":["e"]},{"start":{"row":4,"column":31},"end":{"row":4,"column":32},"action":"insert","lines":["n"]},{"start":{"row":4,"column":32},"end":{"row":4,"column":33},"action":"insert","lines":["t"]},{"start":{"row":4,"column":33},"end":{"row":4,"column":34},"action":"insert","lines":["."]},{"start":{"row":4,"column":34},"end":{"row":4,"column":35},"action":"insert","lines":["q"]},{"start":{"row":4,"column":35},"end":{"row":4,"column":36},"action":"insert","lines":["u"]},{"start":{"row":4,"column":36},"end":{"row":4,"column":37},"action":"insert","lines":["e"]},{"start":{"row":4,"column":37},"end":{"row":4,"column":38},"action":"insert","lines":["r"]},{"start":{"row":4,"column":38},"end":{"row":4,"column":39},"action":"insert","lines":["y"]},{"start":{"row":4,"column":39},"end":{"row":4,"column":40},"action":"insert","lines":["S"]}],[{"start":{"row":4,"column":40},"end":{"row":4,"column":41},"action":"insert","lines":["e"],"id":10},{"start":{"row":4,"column":41},"end":{"row":4,"column":42},"action":"insert","lines":["l"]},{"start":{"row":4,"column":42},"end":{"row":4,"column":43},"action":"insert","lines":["e"]},{"start":{"row":4,"column":43},"end":{"row":4,"column":44},"action":"insert","lines":["c"]},{"start":{"row":4,"column":44},"end":{"row":4,"column":45},"action":"insert","lines":["t"]},{"start":{"row":4,"column":45},"end":{"row":4,"column":46},"action":"insert","lines":["o"]},{"start":{"row":4,"column":46},"end":{"row":4,"column":47},"action":"insert","lines":["r"]}],[{"start":{"row":4,"column":47},"end":{"row":4,"column":49},"action":"insert","lines":["()"],"id":11}],[{"start":{"row":4,"column":48},"end":{"row":4,"column":50},"action":"insert","lines":["''"],"id":12}],[{"start":{"row":4,"column":49},"end":{"row":4,"column":50},"action":"insert","lines":["#"],"id":13},{"start":{"row":4,"column":50},"end":{"row":4,"column":51},"action":"insert","lines":["i"]},{"start":{"row":4,"column":51},"end":{"row":4,"column":52},"action":"insert","lines":["m"]},{"start":{"row":4,"column":52},"end":{"row":4,"column":53},"action":"insert","lines":["a"]},{"start":{"row":4,"column":53},"end":{"row":4,"column":54},"action":"insert","lines":["g"]},{"start":{"row":4,"column":54},"end":{"row":4,"column":55},"action":"insert","lines":["e"]},{"start":{"row":4,"column":55},"end":{"row":4,"column":56},"action":"insert","lines":["-"]},{"start":{"row":4,"column":56},"end":{"row":4,"column":57},"action":"insert","lines":["l"]},{"start":{"row":4,"column":57},"end":{"row":4,"column":58},"action":"insert","lines":["i"]},{"start":{"row":4,"column":58},"end":{"row":4,"column":59},"action":"insert","lines":["n"]},{"start":{"row":4,"column":59},"end":{"row":4,"column":60},"action":"insert","lines":["k"]},{"start":{"row":4,"column":60},"end":{"row":4,"column":61},"action":"insert","lines":["-"]}],[{"start":{"row":4,"column":61},"end":{"row":4,"column":62},"action":"insert","lines":["o"],"id":14}],[{"start":{"row":4,"column":61},"end":{"row":4,"column":62},"action":"remove","lines":["o"],"id":15}],[{"start":{"row":4,"column":61},"end":{"row":4,"column":62},"action":"insert","lines":["c"],"id":16},{"start":{"row":4,"column":62},"end":{"row":4,"column":63},"action":"insert","lines":["o"]},{"start":{"row":4,"column":63},"end":{"row":4,"column":64},"action":"insert","lines":["n"]},{"start":{"row":4,"column":64},"end":{"row":4,"column":65},"action":"insert","lines":["t"]},{"start":{"row":4,"column":65},"end":{"row":4,"column":66},"action":"insert","lines":["a"]},{"start":{"row":4,"column":66},"end":{"row":4,"column":67},"action":"insert","lines":["i"]},{"start":{"row":4,"column":67},"end":{"row":4,"column":68},"action":"insert","lines":["n"]},{"start":{"row":4,"column":68},"end":{"row":4,"column":69},"action":"insert","lines":["e"]},{"start":{"row":4,"column":69},"end":{"row":4,"column":70},"action":"insert","lines":["r"]}],[{"start":{"row":4,"column":72},"end":{"row":4,"column":73},"action":"insert","lines":[";"],"id":18}],[{"start":{"row":0,"column":4},"end":{"row":0,"column":13},"action":"remove","lines":["container"],"id":19},{"start":{"row":0,"column":4},"end":{"row":0,"column":5},"action":"insert","lines":["i"]},{"start":{"row":0,"column":5},"end":{"row":0,"column":6},"action":"insert","lines":["m"]},{"start":{"row":0,"column":6},"end":{"row":0,"column":7},"action":"insert","lines":["g"]},{"start":{"row":0,"column":7},"end":{"row":0,"column":8},"action":"insert","lines":["C"]},{"start":{"row":0,"column":8},"end":{"row":0,"column":9},"action":"insert","lines":["a"]}],[{"start":{"row":0,"column":9},"end":{"row":0,"column":10},"action":"insert","lines":["r"],"id":20},{"start":{"row":0,"column":10},"end":{"row":0,"column":11},"action":"insert","lines":["d"]},{"start":{"row":0,"column":11},"end":{"row":0,"column":12},"action":"insert","lines":["B"]},{"start":{"row":0,"column":12},"end":{"row":0,"column":13},"action":"insert","lines":["o"]}],[{"start":{"row":0,"column":13},"end":{"row":0,"column":14},"action":"insert","lines":["c"],"id":21}],[{"start":{"row":0,"column":13},"end":{"row":0,"column":14},"action":"remove","lines":["c"],"id":22}],[{"start":{"row":0,"column":13},"end":{"row":0,"column":14},"action":"insert","lines":["d"],"id":23},{"start":{"row":0,"column":14},"end":{"row":0,"column":15},"action":"insert","lines":["y"]}],[{"start":{"row":11,"column":12},"end":{"row":11,"column":21},"action":"remove","lines":["container"],"id":24},{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["i"]},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["m"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["g"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["a"]}],[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":["a"],"id":25}],[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["C"],"id":26},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["a"]},{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"insert","lines":["r"]},{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"insert","lines":["d"]}],[{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"insert","lines":["B"],"id":27}],[{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"insert","lines":["o"],"id":28},{"start":{"row":11,"column":21},"end":{"row":11,"column":22},"action":"insert","lines":["d"]},{"start":{"row":11,"column":22},"end":{"row":11,"column":23},"action":"insert","lines":["y"]}],[{"start":{"row":30,"column":4},"end":{"row":30,"column":13},"action":"remove","lines":["container"],"id":29},{"start":{"row":30,"column":4},"end":{"row":30,"column":5},"action":"insert","lines":["i"]},{"start":{"row":30,"column":5},"end":{"row":30,"column":6},"action":"insert","lines":["m"]},{"start":{"row":30,"column":6},"end":{"row":30,"column":7},"action":"insert","lines":["g"]},{"start":{"row":30,"column":7},"end":{"row":30,"column":8},"action":"insert","lines":["C"]},{"start":{"row":30,"column":8},"end":{"row":30,"column":9},"action":"insert","lines":["a"]},{"start":{"row":30,"column":9},"end":{"row":30,"column":10},"action":"insert","lines":["r"]},{"start":{"row":30,"column":10},"end":{"row":30,"column":11},"action":"insert","lines":["d"]},{"start":{"row":30,"column":11},"end":{"row":30,"column":12},"action":"insert","lines":["B"]},{"start":{"row":30,"column":12},"end":{"row":30,"column":13},"action":"insert","lines":["o"]},{"start":{"row":30,"column":13},"end":{"row":30,"column":14},"action":"insert","lines":["d"]}],[{"start":{"row":30,"column":14},"end":{"row":30,"column":15},"action":"insert","lines":["y"],"id":30}],[{"start":{"row":12,"column":12},"end":{"row":12,"column":13},"action":"insert","lines":["i"],"id":31},{"start":{"row":12,"column":13},"end":{"row":12,"column":14},"action":"insert","lines":["m"]},{"start":{"row":12,"column":14},"end":{"row":12,"column":15},"action":"insert","lines":["a"]},{"start":{"row":12,"column":15},"end":{"row":12,"column":16},"action":"insert","lines":["g"]},{"start":{"row":12,"column":16},"end":{"row":12,"column":17},"action":"insert","lines":["e"]},{"start":{"row":12,"column":17},"end":{"row":12,"column":18},"action":"insert","lines":["L"]},{"start":{"row":12,"column":18},"end":{"row":12,"column":19},"action":"insert","lines":["i"]},{"start":{"row":12,"column":19},"end":{"row":12,"column":20},"action":"insert","lines":["n"]},{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"insert","lines":["k"]},{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"insert","lines":["C"]},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["o"]},{"start":{"row":12,"column":23},"end":{"row":12,"column":24},"action":"insert","lines":["n"]},{"start":{"row":12,"column":24},"end":{"row":12,"column":25},"action":"insert","lines":["t"]},{"start":{"row":12,"column":25},"end":{"row":12,"column":26},"action":"insert","lines":["a"]}],[{"start":{"row":12,"column":26},"end":{"row":12,"column":27},"action":"insert","lines":["i"],"id":32},{"start":{"row":12,"column":27},"end":{"row":12,"column":28},"action":"insert","lines":["n"]},{"start":{"row":12,"column":28},"end":{"row":12,"column":29},"action":"insert","lines":["e"]},{"start":{"row":12,"column":29},"end":{"row":12,"column":30},"action":"insert","lines":["r"]},{"start":{"row":12,"column":30},"end":{"row":12,"column":31},"action":"insert","lines":["."]},{"start":{"row":12,"column":31},"end":{"row":12,"column":32},"action":"insert","lines":["s"]},{"start":{"row":12,"column":32},"end":{"row":12,"column":33},"action":"insert","lines":["t"]},{"start":{"row":12,"column":33},"end":{"row":12,"column":34},"action":"insert","lines":["y"]},{"start":{"row":12,"column":34},"end":{"row":12,"column":35},"action":"insert","lines":["l"]},{"start":{"row":12,"column":35},"end":{"row":12,"column":36},"action":"insert","lines":["e"]},{"start":{"row":12,"column":36},"end":{"row":12,"column":37},"action":"insert","lines":["."]},{"start":{"row":12,"column":37},"end":{"row":12,"column":38},"action":"insert","lines":["d"]},{"start":{"row":12,"column":38},"end":{"row":12,"column":39},"action":"insert","lines":["i"]}],[{"start":{"row":12,"column":39},"end":{"row":12,"column":40},"action":"insert","lines":["s"],"id":33},{"start":{"row":12,"column":40},"end":{"row":12,"column":41},"action":"insert","lines":["p"]},{"start":{"row":12,"column":41},"end":{"row":12,"column":42},"action":"insert","lines":["l"]},{"start":{"row":12,"column":42},"end":{"row":12,"column":43},"action":"insert","lines":[","]},{"start":{"row":12,"column":43},"end":{"row":12,"column":44},"action":"insert","lines":["a"]},{"start":{"row":12,"column":44},"end":{"row":12,"column":45},"action":"insert","lines":["y"]}],[{"start":{"row":12,"column":45},"end":{"row":12,"column":46},"action":"insert","lines":[" "],"id":34}],[{"start":{"row":12,"column":45},"end":{"row":12,"column":46},"action":"remove","lines":[" "],"id":35},{"start":{"row":12,"column":44},"end":{"row":12,"column":45},"action":"remove","lines":["y"]},{"start":{"row":12,"column":43},"end":{"row":12,"column":44},"action":"remove","lines":["a"]},{"start":{"row":12,"column":42},"end":{"row":12,"column":43},"action":"remove","lines":[","]}],[{"start":{"row":12,"column":42},"end":{"row":12,"column":43},"action":"insert","lines":["a"],"id":36},{"start":{"row":12,"column":43},"end":{"row":12,"column":44},"action":"insert","lines":["y"]}],[{"start":{"row":12,"column":44},"end":{"row":12,"column":45},"action":"insert","lines":[" "],"id":37},{"start":{"row":12,"column":45},"end":{"row":12,"column":46},"action":"insert","lines":["="]}],[{"start":{"row":12,"column":46},"end":{"row":12,"column":47},"action":"insert","lines":[" "],"id":38}],[{"start":{"row":12,"column":47},"end":{"row":12,"column":49},"action":"insert","lines":["''"],"id":39}],[{"start":{"row":12,"column":48},"end":{"row":12,"column":49},"action":"insert","lines":["n"],"id":40},{"start":{"row":12,"column":49},"end":{"row":12,"column":50},"action":"insert","lines":["o"]},{"start":{"row":12,"column":50},"end":{"row":12,"column":51},"action":"insert","lines":["n"]},{"start":{"row":12,"column":51},"end":{"row":12,"column":52},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":53},"end":{"row":12,"column":54},"action":"insert","lines":[";"],"id":41}],[{"start":{"row":12,"column":54},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":42},{"start":{"row":13,"column":0},"end":{"row":13,"column":12},"action":"insert","lines":["            "]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":0,"column":0},"end":{"row":36,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1575408679612,"hash":"a469b0688ed861fab671779898fb6b510b44fc08"}