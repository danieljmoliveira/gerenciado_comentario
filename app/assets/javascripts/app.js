  $(document).ready(function(){
    $('#btn_passo_01').click(function(){

      var nome = $('#banco_ideium_nome').val();
      var email = $('#banco_ideium_email').val();
      var estado = $('#banco_ideium_estado').val();
      var cidade = $('#banco_ideium_cidade').val();
      var telefone = $('#banco_ideium_telefone').val();
      if ( nome == "" || email == "" || estado == "" || cidade == "" || telefone == "" ){
        alert('Preencher todos os campos corretamente.')
      }else{
        if(email.indexOf('@') == "-1"){
          alert('Erro na verificação do email.');
        }else{
          $('#id_passo_01').hide();
          $('#id_passo_02').show();
        }
      }

    });
    $('#btn_passo_02').click(function(){
      if ($('.tema.btn.btn-success').length == 0 ){
        alert('Selecionar algum tema.')
      }else{
        $('#id_passo_02').hide();
        $('#id_passo_03').show();
      }
    });

    $('.tema').click(function(){ 
      $(this).toggleClass('btn-success');
      var arr = []
      $('#tema_selecionado').val(arr);

      $.each($('.tema.btn.btn-success'), function(index, value){
          arr.push($('.tema.btn.btn-success')[index].attributes['id_tema'].value)  
      });
      $('#tema_selecionado').val(arr);
    });

    $('#escolher_tema').change(function(){
      codigo = $(this).val();
      $.ajax({
        url : 'exibir_ideias_tema',
        type : 'GET',
        data : "codigo_tema="+codigo,
        success: function(data){
          $('#id_ideias').html(data);
        },
        error: function(){
          alert('erro');
        }
      });
    });

    $('.ver_mais').click(function(){
      codigo = $(this).attr('data-ideia');
      $.ajax({
        url : 'exibir_ideia_completa',
        type : 'GET',
        data : "codigo_ideia="+codigo,
        success: function(data){
          $('#id_ideias').html(data);
        },
        error: function(){
          alert('erro');
        }
      });
    });

    /* FACEBOOK */
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&appId=257119214411780&version=v2.0";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    /* TWITER */
    !function(d,s,id){ 
      var js,fjs=d.getElementsByTagName(s)[0];
      if(!d.getElementById(id)){
        js=d.createElement(s);
        js.id=id;js.src="https://platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js,fjs);
      }
    }(document,"script","twitter-wjs");

    /*GOOGLE*/
    (function() {
      var po = document.createElement('script'); 
      po.type = 'text/javascript'; 
      po.async = true;
      po.src = 'https://apis.google.com/js/platform.js';
      var s = document.getElementsByTagName('script')[0]; 
      s.parentNode.insertBefore(po, s);
    })();

    /*estado - cidade*/
    $('#banco_ideium_estado').change(function(){
      var estado = $(this).val();
      $.ajax({
        url : 'escolher_cidade',
        type : 'GET',
        data : 'estado=' + estado,
        success : function(data){
          $('#banco_ideium_cidade').html(data);
        },
        error : function(){
          alert('Ocorreu um erro!')
        }
      })
    });

    $('.classificar').click(function(){
      var opcao = $(this).attr('data-opcao');
      var numero = $(this).attr('data-ideia');
      $.ajax({
        url : 'classificar_ideia',
        type : 'GET',
        data : 'numero=' + numero + '&opcao='+ opcao,
        success : function(data){
          //$('#banco_ideium_cidade').html(data);
        },
        error : function(){
          alert('Ocorreu um erro!')
        }
      })
    });
  });