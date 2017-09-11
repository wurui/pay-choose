define([],function(){
  return {
    init:function($mod){

        var payurl=$mod.attr('data-payurl');
        var f=$('form',$mod).on('change',function(e){
            var paymethod=f.paymethod.value;
            //console.log('ssss',paymethod);
            f.action=payurl.replace(/\{paymethod\}/g,paymethod);

        })[0];
    }
  }
})
