<%-- 
    Document   : homeAdmin
    Created on : Feb 16, 2021, 10:57:07 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./css/searchForm.css">
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/manageQuizAdmin.css">

        <title>Admin Page</title>
    </head>
    <body>
        <!--header-->
        <c:set var="user" value="${sessionScope.USER}"/>
        <div class="header">
            <a href="" class="logo">Quiz Online</a>
            <div class="header-right">
                <a class="active" href="loadQuestionAdmin">Home</a>
                <a style="color: red;" >Welcome, ${user.name}</a>
                <a href="addNewQuestionPage">Add New Question</a>
                <a href="showHistoryPage">Show History</a>
                <a href="logout">Log out</a>
            </div>
        </div>
        <!-- end header-->
        <div style="margin-top: 40px;"></div>
        <!--search-->
        <div class="container">
            <div class="row">
                <div class="col-sm-5">
                    <form class="example" action="loadQuestionAdminByQuestionName">
                        <input type="text" placeholder="Search By Question Name.." name="searchQuestionNameValue" value="${param.searchQuestionNameValue}" required/>
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-2">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            Subject
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="loadQuestionAdminBySubject?subjectID=PRJ321">PRJ321</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="loadQuestionAdminBySubject?subjectID=PRJ311">PRJ311</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-2">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            Status
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="loadQuestionAdminByStatus?status=true">Active</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="loadQuestionAdminByStatus?status=false">Inactive</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--end search-->

        <div style="margin-top: 40px;"></div>
        <c:set var="map" value="${requestScope.MAPQUIZ}"/>
        <c:if test="${not empty map}">
            <c:forEach var="dto" items="${map}">
                <form action="updateQuestion">
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-7">

                            <div class="input-group input-group-lg">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-lg">Question ${dto.key}</span>
                                </div>
                                <c:set var="listAnswer" value="${dto.value}"/>
                                <c:forEach var="answer" items="${listAnswer}">
                                    <c:set var="questionContent" value="${answer.questionContent}"/>
                                </c:forEach>
                                <input type="text" name="questionContent" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                       value="${questionContent}">

                            </div>


                            <div class="groupAnswer">
                                <div style="margin-top: 10px;"></div>

                                <div class="input-group-prepend">
                                    <span style="color: green;font-size: 18px;" class="input-group-text" id="inputGroup-sizing-lg">Content Answer</span>
                                </div>
                                <c:forEach var="answer" items="${listAnswer}">
                                    <c:if test="${answer.correct eq false}">
                                        <input type="text" name="answerContent" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                               value="${answer.answerContent}">        
                                    </c:if>    
                                </c:forEach>
                            </div>
                            <c:forEach var="answer" items="${listAnswer}">
                                <c:if test="${answer.correct eq true}">
                                    <div class="input-group input-group-lg">
                                        <div class="input-group-prepend">
                                            <span style="color: blue;" class="input-group-text" id="inputGroup-sizing-lg">Answer Correct</span>
                                        </div>
                                        <input type="text" name="answerCorrect" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                               value="${answer.answerContent}">
                                    </div>      
                                </c:if>    
                            </c:forEach>

                        </div>
                        <div class="col-sm-4">
                            <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
                                <c:set var="listQuestion" value="${requestScope.LISTQUESTION}"/>
                                <c:forEach var="question" items="${listQuestion}">
                                    <c:if test="${question.questionID == dto.key}">
                                        <input type="hidden" name="key" value="${dto.key}" />

                                        <input type="hidden" name="actionLoad" value="${requestScope.ACTIONLOAD}" />
                                        <input type="hidden" name="pageIndex" value="${requestScope.PAGEINDEX}" />
                                        <input type="hidden" name="searchQuestionNameValue" value="${param.searchQuestionNameValue}" />
                                        <input type="hidden" name="status" value="${param.status}" />
                                        <input type="hidden" name="subjectID" value="${param.subjectID}" />

                                        <div class="card-header">
                                            Status And Subject
                                        </div>
                                        <div class="card-body">
                                            Status
                                            <select class="custom-select" name="statusQuestion">
                                                <c:if test="${question.status eq true}">
                                                    <option value="true">Active</option>
                                                    <option value="false">Inactive</option>    
                                                </c:if>
                                                <c:if test="${question.status eq false}">
                                                    <option value="false">Inactive</option>
                                                    <option value="true">Active</option>    
                                                </c:if>
                                            </select>
                                            <div class="dropdown-divider"></div>
                                            Subject
                                            <select class="custom-select" name="subjectIDQuestion">
                                                <c:if test="${question.subjectID == 'PRJ321'}">
                                                    <option value="PRJ321">PRJ321</option>
                                                    <option value="PRJ311">PRJ311</option>    
                                                </c:if>
                                                <c:if test="${question.subjectID == 'PRJ311'}">
                                                    <option value="PRJ311">PRJ311</option>    
                                                    <option value="PRJ321">PRJ321</option>
                                                </c:if>
                                            </select>
                                        </c:if>
                                    </c:forEach>
                                    <div class="dropdown-divider"></div>

                                    <button type="submit" class="btn btn-primary btn-lg" style="font-weight: bold;">Update</button>

                                    <c:url var="urlDeleteQuestion" value="deleteQuestion">
                                        <c:param name="key" value="${dto.key}"/>
                                        <c:param name="actionLoad" value="${requestScope.ACTIONLOAD}"/>
                                        <c:param name="pageIndex" value="${requestScope.PAGEINDEX}"/>
                                        <c:param name="searchQuestionNameValue" value="${param.searchQuestionNameValue}"/>
                                        <c:param name="status" value="${param.status}"/>
                                        <c:param name="subjectID" value="${param.subjectID}"/>
                                    </c:url>
                                    <a style="font-weight: bold;" class="btn btn-danger btn-lg" href="${urlDeleteQuestion}">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <hr style="background-color: black;">
            </c:forEach>
            <div style="margin-top: 20px;"></div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    
                    <c:set var="totalPage" value="${requestScope.TOTALPAGE}"/>
                    <c:set var="pageIndex" value="${requestScope.PAGEINDEX}"/>
                    <c:set var="actionLoad" value="${requestScope.ACTIONLOAD}"/>
                    
                    <c:url var="urlRewrtitingPrevious" value="${actionLoad}">
                        <c:param name="pageIndex" value="${pageIndex-1}"/>
                        <c:param name="searchQuestionNameValue" value="${param.searchQuestionNameValue}"/>
                        <c:param name="status" value="${param.status}"/>
                        <c:param name="subjectID" value="${param.subjectID}"/>
                    </c:url>
                    
                    <c:if test="${pageIndex<=1}">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                    </c:if>
                    <c:if test="${pageIndex>1}">
                        <li class="page-item ">
                            <a class="page-link" href="${urlRewrtitingPrevious}">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach var="page" begin="1" end="${totalPage}">
                        <c:url var="urlRewrtiting" value="${actionLoad}">
                            <c:param name="pageIndex" value="${page}"/>
                            <c:param name="searchQuestionNameValue" value="${param.searchQuestionNameValue}"/>
                            <c:param name="status" value="${param.status}"/>
                            <c:param name="subjectID" value="${param.subjectID}"/>
                        </c:url>

                        <c:if test="${pageIndex == page}">
                            <li class="page-item active"><a class="page-link" href="${urlRewrtiting}">${page}</a></li>    
                            </c:if>
                            <c:if test="${pageIndex != page}">
                            <li class="page-item "><a class="page-link" href="${urlRewrtiting}">${page}</a></li>
                            </c:if>
                        </c:forEach>


                    <c:url var="urlRewrtitingNext" value="${actionLoad}">
                        <c:param name="pageIndex" value="${pageIndex+1}"/>
                        <c:param name="searchQuestionNameValue" value="${param.searchQuestionNameValue}"/>
                        <c:param name="status" value="${param.status}"/>
                        <c:param name="subjectID" value="${param.subjectID}"/>
                    </c:url>
                    <c:if test="${pageIndex>=totalPage}">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Next</a>
                        </li>
                    </c:if>
                    <c:if test="${pageIndex<totalPage}">
                        <li class="page-item ">
                            <a class="page-link" href="${urlRewrtitingNext}">Next</a>
                        </li>
                    </c:if>

                </ul>
            </nav>
        </c:if>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    </body>
</html>
