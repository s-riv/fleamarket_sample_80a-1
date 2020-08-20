$(document).click(function(){
    $( '.input-default' ).on('click', function(){
      let name = $(this).val();
      if(name == 0){
        $('.input-default').css('border-color','red');
        $('.no-product-name').text('入力してください');
      }else{
        $('.input-default').css('border-color','');
        $('.no-product-name').text('');
      };
    });
    $( '.input-default' ).on('change',function(){
      let name = $(this).val();
      if(name == 0){
        $('.input-default').css('border-color','red');
        $('.no-product-name').text('入力してください');
      }else{
        $('.input-default').css('border-color','');
        $('.no-product-name').text('');
      };
    });

  $('.textarea-default').on('click', function(){
    let description = $(this).val();
    if(description == 0){
      $('.textarea-default').css('border-color','red')
      $('.no-product1').text('入力してください')
    }else{
      $('.textarea-default').css('border-color','')
      $('.no-product1').text('')
    }
  })
  $('.textarea-default').on('change',function(){
    let description = $(this).val();
    if(description == 0){
      $('.textarea-default').css('border-color','red')
      $('.no-product1').text('入力してください')
    }else{
      $('.textarea-default').css('border-color','')
      $('.no-product1').text('')
    }
  });
  
  $('.select-default2').on('change',function(){
    let condition = $(this).val();
    if(condition == ''){
      $('.select-default2').css('border-color','red')
      $('.no-product2').text('選択してください')
    }else{
      $('.select-default2').css('border-color','')
      $('.no-product2').text('')
    }
  });


  $('.select-default3').on('change',function(){
    let send_price = $(this).val();
    if(send_price == ""){
      $('.select-default3').css('border-color','red')
      $('.no-product3').text('選択してください')
    }else{
      $('.select-default3').css('border-color','')
      $('.no-product3').text('')
    }
  });

  $('.select-default4').on('change',function(){
    let prefecture_id = $(this).val();
    if(prefecture_id == ""){
      $('.select-default4').css('border-color','red')
      $('.no-product4').text('選択してください')
    }else{
      $('.select-default4').css('border-color','')
      $('.no-product4').text('')
    }
  });

  $('.select-default5').on('change',function(){
    let ship_day = $(this).val();
    if(ship_day == ""){
      $('.select-default5').css('border-color','red')
      $('.no-product5').text('選択してください')
    }else{
      $('.select-default5').css('border-color','')
      $('.no-product5').text('')
    }
  });


  $( '.tk-price' ).on('click', function(){
    let price = $(this).val();
    if( price == 0){
      $('.tk-price').css('border-color','red')
      $('.no-product6').text('300以上9999999以下で入力してください')
    }else{
      $('.tk-price').css('border-color','')
      $('.no-product6').text('')
    }
  });
  $( '.tk-price' ).on('change',function(){
    let price = $(this).val();
    if( price == 0){
      $('.tk-price').css('border-color','red')
      $('.no-product6').text('300以上9999999以下で入力してください')
    }else{
      $('.tk-price').css('border-color','')
      $('.no-product6').text('')
    }
  });
  

    let buildPrompt = `<option value>---</option>`
    let buildHtmlOption = function(parent) {
      let option = `<option value ="${parent.id}">${parent.name}</option>`
      return option
    }
    $('#parent').change(function() {
      let parent_id = $(this).val();
      $.ajax({
        type: 'GET',
        url: '/products/new/mid_category',
        data: {big_category_id: parent_id},
        dataType: 'json'
      })
      .done(function(parent) {
        $('.child').css('display', 'block');
        $('#child').empty();
        $('.grand_child').css('display', 'none');
        $('#child').append(buildPrompt);

        parent.forEach(function(child) {
          let html_option = buildHtmlOption(child);
          $('#child').append(html_option);
        });
      })
      .fail(function() {
        alert('選択に失敗しました')
      });
    });

    $(this).on("change", "#child", function() {
      let parent_id = $("#parent").val();
      let child_id = $("#child").val();

      $.ajax({
          type: 'GET',
          url: '/products/new/small_category',
          data: {
            big_category_id: parent_id,
            mid_category_id: child_id
          },
          dataType: 'json'
      })
      .done(function(parent) {
        $('.grand_child').css('display', 'block');
        $('#grand_child').empty();
        $('#grand_child').append(buildPrompt);

        parent.forEach(function(child) {
          let html_option = buildHtmlOption(child);
          $('#grand_child').append(html_option);
          $('.no-product1').text('');
        });
      })

    });


  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][image]"
                    id="product_images_attributes_${num}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="200px" height="200px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box-1').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else{
        $('#previews').append(buildImg(targetIndex, blobUrl));
         $('#image-box-1').append(buildFileField(fileIndex[0]));
         fileIndex.shift();
         $(this).css('display', 'none')
         if (  $('.js-file_group').length == 11){
           $('.js-file_group:last').css('display', 'none');
          }
        }
  });

  $('#image-box-1').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $('.js-file_group:last').css('display', 'block');
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box-1').append(buildFileField(fileIndex[0]));
    if ($('.js-file').length <= 10){ }
  });

});