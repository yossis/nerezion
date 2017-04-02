function modalPopUp(e){
  $('.modal').modal('hide');
  var modalId = $(e).data('target');
  if($(modalId).find('form')[0] != null)
     $(modalId).find('form')[0].reset();

  switch(modalId) {
    case '#modalInvite':
      var full_name = $(e).text();
      $('.username-for-sms').html(full_name);
      $('#modalInvite .modal-body h3').html('הזמנה ל'+full_name);
      $('#modalInvite .modal-body h4').html('הכנס/י את מספר הטלפון של '+full_name+ ' במספרים בלבד!');
      $('#hidden_pupil_id').val($(e).data('uid'));
      $('#invited_phone').attr('placeholder', 'מספר הטלפון של ' + full_name);


      break;
  }

  $(modalId).modal('show');
};



$(document).ready(function(){
  $('.reset-on-press').keypress(function(e) {
    //e.preventDefault();
    $('.modal-message').html('');
  });

  $(document).on('click' , '.modal-popup', function(e) {
   e.preventDefault();
   modalPopUp(this);

  });

  $('.toggle-forms').on('click', function(){
    $('#registration').toggle();
    $('#notInList').toggle();
    if ($('#notInList').is(":visible")) {
      $(this).html('חזרה להרשמה לפי רשימת השמות');
    }
    else {
      $(this).html('אם אינך מופיע/ה ברשימה נא לחצ/י כאן');
    }

  })
});
