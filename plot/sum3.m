function r = sum3(a)
    r_sum = sum(sum(sum(a)));
    r = squeeze(r_sum);
end