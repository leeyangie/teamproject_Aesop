<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>향수</title>
<jsp:include page="${path1 }/head.jsp"></jsp:include>
<style>
        * { margin: 0; padding: 0;}
        body { 
            font-family: "Noto Sans KR", sans-serif;
            color:#252525;
            font-size: 14px;
            overflow-x: hidden;
        }
        li { list-style: none;}
        a { text-decoration: none; color: #252525;}
        .content { 
            width: 100vw; 
            overflow-x: hidden; 
            background-color: #FFFEF2;
            overflow-y: scroll;
        }
        #mainsection{
            height: 1300px;
        }
        .fr-prev::after, .fr-next::after {
            font-family: 'FontAwesome';
            font-size: 18px;
        }
        .fr-prev::after {
            content: '\f104'; /* FontAwesome 왼쪽 화살표 아이콘 */
        }
        .fr-next::after {
            content: '\f105'; /* FontAwesome 오른쪽 화살표 아이콘 */
        }
        .fr-carousel {
            height: 300px;
            width: 100%;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
        }
        .fr-container {
            display: flex;
            height: 300px;
            transition: transform 0.5s ease;
        }
        .fr-cell {
            width: 180px;
            height: 300px;
            display: inline-block;
            overflow: hidden;
        }
        .fr-cell img { 
            height: 100%;
            transition: 0.5s;
         }
        .button-container {
            position: absolute;
            width: 100%;
            display: flex;
            justify-content: space-between;
            z-index: 50;
        }
        .fr-prev, .fr-next {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            position: absolute;
        }
        .fr-prev {
            left: calc(50% - 100px); /* 중앙 이미지의 왼쪽 */
        }
        .fr-next {
            right: calc(50% - 100px); /* 중앙 이미지의 오른쪽 */
        }
        .fr-prev:focus, .fr-next:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="content">
        <header></header>
        <main>
            <section id="topmain">
                <div class="text25">향수</div>
                <div><p>이솝의 바디와 핸드 제품은 효과적인 클렌징, 수분 공급, 퍼스널 케어에 따른 고민 완화 등 일상적일 수 있는 경험을 한층 풍성하게 만들어줍니다.</p></div>
            </section>
            <section id="categorysection">
                <div id="category-All">모든 향수</div>
                <nav id="categorylist">
                    <ul>
                        <li><a href="">플로럴</a></li>
                        <li><a href="">프레쉬</a></li>
                        <li><a href="">우디</a></li>
                        <li><a href="">오퓰런트</a></li>
                    </ul>
                </nav>
            </section>
            <section id="mainsection">
                <div id="explore_wrap">
                    <div class="tex25">유형별 제품 탐색하기</div>
                    <div id="explore">
                        <div class="ex-item">
                            <img src="" alt="">
                            <div class="ex-itemname">플로럴</div>
                        </div>
                        <div class="ex-item">
                            <img src="" alt="">
                            <div class="ex-itemname">프레쉬</div>
                        </div>
                        <div class="ex-item">
                            <img src="" alt="">
                            <div class="ex-itemname">우디</div>
                        </div>
                        <div class="ex-item">
                            <img src="" alt="">
                            <div class="ex-itemname">오퓰런트</div>
                        </div>
                    </div>
                </div>
                <div class="text-ofl">Compare our Fragrances</div>
                <div class="fr-carousel_wrap">
                    <div class="fr-carousel">
                        <div class="button-container">
                            <button class="fr-prev"></button>
                            <button class="fr-next"></button>
                        </div>
                        <ul class="fr-container">
                            <li class="fr-cell"><img src="images/product/fragrance/Tacit.png" alt="테싯"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Karst.png" alt="카르스트"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Eremia.png" alt="에레미야"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Gloam.png" alt="글롬"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Rozu.png" alt="로즈"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Marrakech.png" alt="마라케시"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Hwyl.png" alt="휠"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Eidesis.png" alt="이더시스"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Miraceti.png" alt="미라세티"></li>
                            <li class="fr-cell"><img src="images/product/fragrance/Ouranon.png" alt="우라논"></li>
                        </ul>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script>
        $(document).ready(function() {
            const container = $('.fr-container');
            const cells = $('.fr-cell');
            const cellWidth = cells.outerWidth();
            const totalCells = cells.length;
            let currentIndex = 0; // 첫 번째 이미지를 가장 처음 위치로 고정

            function updateOpacity() {
                cells.each(function(index) {
                    $(this).find('img').css('opacity', index === currentIndex ? '1' : '0.5');
                });
            }

            function updateCarousel() {
                const offset = -(currentIndex * cellWidth - ($('.fr-carousel').width() / 2 - cellWidth / 2));
                container.css('transform', 'translateX(' + offset + 'px)');
                updateOpacity();
            }

            $('.fr-prev').click(function() {
                currentIndex = (currentIndex > 0) ? currentIndex - 1 : 0;
                updateCarousel();
            });

            $('.fr-next').click(function() {
                currentIndex = (currentIndex < totalCells - 1) ? currentIndex + 1 : totalCells - 1;
                updateCarousel();
            });

            updateCarousel(); // 초기 상태 업데이트
        });
    </script>
</body>
</html>