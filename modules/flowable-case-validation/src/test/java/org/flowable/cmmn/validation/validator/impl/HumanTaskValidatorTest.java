/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.flowable.cmmn.validation.validator.impl;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.flowable.cmmn.converter.CmmnXmlConverter;
import org.flowable.cmmn.model.CmmnModel;
import org.flowable.cmmn.validation.validator.ValidationEntry;
import org.junit.Test;

/**
 * @author Calin Cerchez
 */
public class HumanTaskValidatorTest {

    private CmmnModel readXMLFile(String resource) {
        return new CmmnXmlConverter().convertToCmmnModel(() -> HumanTaskValidatorTest.class.getResourceAsStream(resource), true, false);
    }

    @Test
    public void testValidateNoErrors() {
        CmmnModel cmmnModel = readXMLFile("humanTaskNoErrors.cmmn");
        List<ValidationEntry> validationEntries = new HumanTaskValidator().validate(cmmnModel);
        Assertions.assertThat(validationEntries.isEmpty()).isTrue();
    }

    @Test
    public void testValidateMissingListenerImplementationType() {
        CmmnModel cmmnModel = readXMLFile("humanTaskMissingListenerImplementationType.cmmn");
        List<ValidationEntry> validationEntries = new HumanTaskValidator().validate(cmmnModel);
        Assertions.assertThat(validationEntries.isEmpty()).isFalse();
        Assertions.assertThat(validationEntries.size()).isEqualTo(1);
        Assertions.assertThat(validationEntries.get(0).getDefaultDescription())
                .isEqualTo("Element 'class', 'expression' or 'delegateExpression' is mandatory on executionListener");
    }
}