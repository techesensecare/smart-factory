// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//x require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/pt
//= require bootstrap
//x require editable/bootstrap-editable
//x require editable/rails
//
//= require ./inspinia/plugins/metisMenu/jquery.metisMenu.js
//= require ./inspinia/plugins/slimscroll/jquery.slimscroll.min.js
//= require ./inspinia/plugins/peity/jquery.peity.min.js
//= require ./inspinia/inspinia.js
// Linha comentada, pois causava pequenos bugs no carregamento da página.
// require ./inspinia/plugins/pace/pace.min.js
//= require ./inspinia/plugins/iCheck/icheck.min.js
//= require ./inspinia/demo/peity-demo.js
//
//= require jquery-maskmoney.js
//= require select2.js
//= require select2_locale_pt-BR.js
//
// Gráficos:
//= require highcharts
//= require chartkick
//
//= require_self

jQuery(function() {
//  $('.chosen').chosen()

  $('.money').maskMoney({prefix: "", allowZero: true, allowNegative: false, thousands: ".", decimal: ",", affixesStay: false});
  $('.nota').maskMoney({prefix: "", allowZero: true, allowNegative: false, thousands: ".", decimal: ",", affixesStay: false, precision: 1});

  $('form.disabled').find('input, select, a, button').attr('disabled', true);

  $('#check-all').click(function() { $('td.check input').prop('checked', $(this).prop('checked')); } )

  formatters = function() {
    $('select.select').select2();
    $('select.select2-ferramentas').select2();
    $('select.select2-produto').select2({
      language: 'pt-br',
      tags: true
    });
  }
  formatters();

  $(document).on('nested:fieldAdded', function() {
    formatters();
  });

  // TODO 
  // Fechar menu lateral
  // $('.sidebar').animate({'margin-left': '-100%'}); $('#page-wrapper').animate({'margin-left': '0'})
  // Abrir menu lateral:
  // $('.sidebar').animate({'margin-left': '0'}); $('#page-wrapper').animate({'margin-left': '250px'})
  // 
  // $('#recolher-menu').click(function() { 
  //   $('.sidebar').animate({'margin-left': '-100%'}); $('#page-wrapper').animate({'margin-left': '0'})
  //   return false;
  // });
  // $('#expandir-menu').click(function() { 
  //    $('.sidebar').animate({'margin-left': '0'}); $('#page-wrapper').animate({'margin-left': '250px'})
  //   return false;
  // });
});
