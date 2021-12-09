// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require toastr


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import "jquery-ui";
import '../stylesheets/application'
import './html.sortable'
import "@fortawesome/fontawesome-free/css/all"
global.toastr = require("toastr")
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }

  function setPositions() {
    $('.card-itemp').each(function(i) {
      $(this).attr('data-pos', i + 1) 
    }) 
  }
  function readySortable () {
    setPositions();
    $('.sortable').sortable();
    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
      var updated_order;
      updated_order = [];
      setPositions();
      $('.card-itemp').each(function(i) {
        updated_order.push({
          id: $(this).data('id'),
          position: i + 1
        });
      });
      $.ajax({
        type: 'PUT',
        url: '/portfolios/sort',
        data: {
          order: updated_order
        }
      });
    });
  }


  $(document).ready(function() {
    readySortable();
  })