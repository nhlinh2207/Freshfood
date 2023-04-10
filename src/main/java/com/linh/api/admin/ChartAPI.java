package com.linh.api.admin;

import com.linh.service.IChartService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@AllArgsConstructor
@Slf4j
public class ChartAPI {

     private final IChartService chartService;

     @GetMapping(path = "/freshfood/chart/pieChart/{year}")
     public List<Integer> pieChart(@PathVariable Integer year) throws ParseException {
          SimpleDateFormat smf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
          Date start = smf.parse("01/01/"+year+" 00:00:00");
          Date end = smf.parse("31/12/"+year+" 23:59:59");
          return chartService.getPieChartData(start, end);
     }

     @GetMapping(path = "/freshfood/chart/lineChart/{year}")
     public List<Float> lineChart(@PathVariable Integer year) throws ParseException {
          SimpleDateFormat smf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
          Date start = smf.parse("01/01/"+year+" 00:00:00");
          Date end = smf.parse("31/12/"+year+" 23:59:59");
          return chartService.getLineChartData(start, end);
     }
}