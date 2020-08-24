$(document).click(function(){
  const editFileField = (num)=> {
  const html = `<div data-index="${num}" class="edit-js-file_group">
                  <input class="edit-js-file" type="file"
                  name="product[images_attributes][${num}][image]"
                  id="product_images_attributes_${num}_src">
                </div>`;
  return html;
  }
  const editImg = (index, url)=> {
    const html = `<div data-index="${index}" class="edit-product-group" >
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="edit-js-remove">削除</div>
                  </div>`;
    return html;
  }

  let editFileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  editlastIndex = $('.edit-js-file_group:last').data('index');
  editFileIndex.splice(0, editlastIndex);


  $('.hidden-destroy').hide();

  $('#edit-image-box').on('change', '.edit-js-file', function(e) {
    const editTargetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${editTargetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else if($('.edit-product-group').length <= 4) {
        $('.edit-previews_child1').append(editImg(editTargetIndex, blobUrl));
         $('#edit-image-box').append(editFileField(editFileIndex[0]));
         editFileIndex.shift();
         editFileIndex.push(editFileIndex[editFileIndex.length - 1] + 1);
         $(this).parent().css('display', 'none')
         $('.edit-js-file_group:last').css('display', 'block')
         }
      else if ($('.edit-product-group').length >= 5){
        $('.edit-previews_child2').append(editImg(editTargetIndex, blobUrl));
         $('#edit-image-box').append(editFileField(editFileIndex[0]));
         editFileIndex.shift();
         editFileIndex.push(editFileIndex[editFileIndex.length - 1] + 1);
         $(this).parent().css('display', 'none')
         $('.edit-js-file_group:last').css('display', 'block')
        }
        if (  $('.edit-product-group').length == 10){
          $('.edit-js-file_group:last').css('display', 'none');
          }
  });

  $('.edit-product-group').on('click', '.edit-js-remove', function() {
    let editNumber = Number($(this).parent().children().data('index'));
    const editHiddenCheck = $(`input[data-index="${editNumber}"].hidden-destroy`);
    $(`.edit-js-file_group[data-index="${editNumber}"]`).remove();
    $(`.edit-product-group[data-index="${editNumber}"]`).remove();
    if (editHiddenCheck) editHiddenCheck.prop('checked', true)

    if ($('.edit-previews_child1').children('.edit-product-group').length <= 4){
        $('.edit-previews_child2').children('.edit-product-group:first').appendTo('.edit-previews_child1');
    }
      if($('.edit-product-group').length == 9 ){
          if ($('.edit-product-btn').val() == null){
          $('.edit-js-file_group:last').css('display', 'block')
          }
        } 
  
      }
    );


  $('.edit-product-btn').on('click', function(){
      if ($('.edit-product-group').length == 10){
        $('#edit-image-box').append(editFileField(editFileIndex[0]));
        editFileIndex.shift();
        editFileIndex.push(editFileIndex[editFileIndex.length - 1] + 1);
        $(this).remove();
      }
      else{
        const  inputNumber = $('.hidden-destroy').length
        $('#edit-image-box').append(editFileField(inputNumber));
        editFileIndex.shift();
        editFileIndex.push(editFileIndex[editFileIndex.length - 1] + 1);
        $(this).remove();
      
        $(`.edit-js-file_group[data-index="${inputNumber}"]`).filter(
          function() {
              return this !== $(`.edit-js-file_group[data-index="${inputNumber}"`).get(0);
          }
        ).remove();
        $('.edit-js-file_group:last').css('display', 'block')
      }
    });
});

