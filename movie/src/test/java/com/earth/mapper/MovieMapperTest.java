package com.earth.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.earth.model.MovieVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MovieMapperTest {
 
     private static final Logger log = LoggerFactory.getLogger(MovieMapperTest.class);
     
     @Autowired
     private MovieMapper mapper;
 
     @Test
     public void testEnroll() {
         
    	 MovieVO vo = new MovieVO();
         
         vo.setMovie_name("mapper test");
         vo.setMovie_runtime(123);
         
         
         mapper.enroll(vo);
         
     }
     
 
}