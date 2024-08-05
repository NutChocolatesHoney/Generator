package NutChocolatesHoney;

import NutChocolatesHoney.core.Builder;
import NutChocolatesHoney.core.BuilderFactory;

import java.io.IOException;


public class Generator {
    public static void main(String[] args) throws IOException {
        Builder builder = BuilderFactory.createBuilder("real");
        builder.build();
    }
}
