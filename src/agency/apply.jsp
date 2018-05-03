<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container applyCnt">
        <h1 class="tc">代理申请</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label">请选择代理类型：</label>
                    <div class="ui-form-group">
                        <p><label><input type="radio" name="level" class="ui-radio j_typeRadio" value="1" />个人合作伙伴(人人都可以申请)</label></p>
                        <p><label><input type="radio"  name="level" class="ui-radio j_typeRadio" value="2" />网店合作伙伴(要求必须有网店)</label></p>
                        <p><label><input type="radio" name="level"  class="ui-radio j_typeRadio" value="3" />实体店合作伙伴(要求必须有实体店铺)</label></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">代理类型：</label>
                    <div class="ui-form-group">
                        <strong class="red j_typeName">个人代理</strong>
                    </div>
                </div>
                <div class="ui-form-item none">
                    <label class="ui-form-label">状态：</label>
                    <div class="ui-form-group">
                        <strong  class="red j_status">申请中</strong>
                    </div>
                </div>
                <p class="sectionTitle">合作伙伴信息：</p>


                <div class="j_applyLevelBox none" level="1">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>代理人姓名：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="代理人姓名"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>代理人地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                </div>
                <div class="j_applyLevelBox none" level="2">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺名称：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="店铺名称" maxlength="32" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>网店地址：</label>
                        <div class="ui-form-group">
                            <input required vtype="url" class="ui-input" name="shopURL" placeholder="网店地址" maxlength="255"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">官网地址：</label>
                        <div class="ui-form-group">
                            <input vtype="url" class="ui-input" name="webSiteURL" placeholder="官网地址" maxlength="255"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>上传店铺资料：</label>
                        <div class="ui-form-group">
                            <div class="uploadBox cf">
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic1" class="attachmentId" />
                                </div>
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic2" class="attachmentId" />
                                </div>
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic3" class="attachmentId" />
                                </div>
                            </div>
                            <p class="ui-field-error">请上传带网店名称的管理后台截图，需要3张图。</p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺所在地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select required class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select required class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select required class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">店铺地址：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="address" placeholder="详细地址"/>
                        </div>
                    </div>
                </div>
                <div class="j_applyLevelBox none" level="3">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺名称：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="店铺名称" maxlength="32" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">网店地址：</label>
                        <div class="ui-form-group">
                            <input required vtype="url"  class="ui-input" name="shopURL" placeholder="网店地址"  maxlength="255" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">官网地址：</label>
                        <div class="ui-form-group">
                            <input vtype="url" class="ui-input" name="webSiteURL" placeholder="官网地址" maxlength="255" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>上传店铺资料：</label>
                        <div class="ui-form-group">
                            <div class="uploadBox cf">
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic1" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic2" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                                <div class="uploadItem fl">
                                    <img src="/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic3" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                            </div>
                            <p class="ui-field-error">请上传带店铺名称的实体店照片，需要3张图。</p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺所在地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select required class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select required class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select required class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">店铺地址：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="address" placeholder="详细地址" maxlength="100" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                </div>

                <p class="sectionTitle">联系人信息：</p>
                <div class="j_contactBox">
                    
                
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>联系人姓名：</label>
                    <div class="ui-form-group">
                        <input required class="ui-input" name="contact" placeholder="联系人姓名" maxlength="32" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>所在地区：</label>
                    <div class="ui-form-group j_distSelect">
                        <select required class="ui-select" name="contactProvince">
                            <option>请选择省份</option>
                        </select>
                        <select required class="ui-select" name="contactCity">
                            <option>请选择城市</option>
                        </select>
                        <select required class="ui-select" name="contactCounty">
                            <option>请选择区县</option>
                        </select>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">详细地址：</label>
                    <div class="ui-form-group">
                        <input maxlength="100" class="ui-input" name="contactAddress" placeholder="详细地址"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>联系手机：</label>
                    <div class="ui-form-group">
                        <input required vtype="phone" class="ui-input" name="contactMobile" placeholder="联系手机"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电话：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="contactTelephone" placeholder="联系电话" maxlength="16" />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系QQ：</label>
                    <div class="ui-form-group">
                        <input vtype="num" class="ui-input" name="contactQQ" placeholder="联系QQ" maxlength="16" minlength="5" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电子邮箱：</label>
                    <div class="ui-form-group">
                        <input vtype="email" class="ui-input" name="contactEMail" placeholder="联系电子邮箱" maxlength="50"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
            </div><!--contactBox -->
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-XL ui-button-yellow" value="提交申请" id="j_submit" />
                    </div>
                </div>
            </form>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/agency/apply.js"></script>
</body>
</html>