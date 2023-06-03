package com.sajura.team_project.controller.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OderDTO {
    private int user_no;
    private List<ProductOderDTO> oder;
}
