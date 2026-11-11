function active = casper_hub_scan_active(action)
persistent depth
if isempty(depth)
    depth = 0;
end
if nargin > 0
    switch action
        case 'enter'
            depth = depth + 1;
        case 'leave'
            assert(depth > 0, 'Unbalanced CASPER Hub scan guard.');
            depth = depth - 1;
        otherwise
            error('Unknown CASPER Hub scan guard action.');
    end
end
active = depth > 0;
end
