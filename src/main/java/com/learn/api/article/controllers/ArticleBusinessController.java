package com.learn.api.article.controllers;

import com.learn.api.article.services.ArticleBusinessService;
import com.learn.api.common.ErrorCode;
import com.learn.api.common.RestResult;
import com.learn.api.common.RestResultGenerator;
import com.learn.api.user.services.UserAccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api("文章内容API")
@RestController
@RequestMapping("/article")
public class ArticleBusinessController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ArticleBusinessController.class);

    @Autowired
    ArticleBusinessService articleBusinessService;

    @Autowired
    UserAccountService userAccountService;

    @ApiOperation(value = "浏览文章")
    @GetMapping("/lookArticle")
    public RestResult<Long> lookArticle(@RequestParam("userId") Long userId,
                                        @RequestParam("articleId") Long articleId) {
        return RestResultGenerator.genSuccessResult(articleBusinessService.lookArticle(userId, articleId));
    }

    @ApiOperation(value = "点赞文章")
    @GetMapping("/likeArticle")
    public RestResult<Long> likeArticle(@RequestParam("userId") Long userId,
                                        @RequestParam("articleId") Long articleId) {
        //校验是否有这个用户
        if (null == userId || null == userAccountService.findById(userId)) {
            return RestResultGenerator.genErrorResult(ErrorCode.USER_IS_NOT);
        }
        return RestResultGenerator.genSuccessResult(articleBusinessService.likeArticle(userId, articleId));
    }

}
