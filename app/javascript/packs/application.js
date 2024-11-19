// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from '@rails/ujs';
Rails.start();
require("@rails/activestorage").start()
require("slick-carousel")

import "slick-carousel/slick/slick.scss"
import "slick-carousel/slick/slick-theme.scss"
import '../stylesheets/application.scss';
import 'bootstrap';
import $ from 'jquery';

window.jQuery = $;
window.$ = $;

$(document).ready(function() {
    $('#autoplay').slick({
        dots: true,
        infinite: true,
        speed: 300,
        mobileFirst:true,
        slidesToShow: 2,
        arrows: true,
        autoplay: true,
        adaptiveHeight: true,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });
})
// document.addEventListener("turbolinks:load", function() {
//     $('#autoplay').slick({
//         dots: true,
//         infinite: true,
//         speed: 300,
//         slidesToShow: 1,
//         arrows: true,
//         autoplay: true,
//         autoplaySpeed: 2000,
//     });
// })
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
