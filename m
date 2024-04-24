Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D216D304
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980932; cv=none; b=P0XP04QQs/rPuAQhTV87u1DxBBu0strjil9MsJ1Envl9f4DpWNWH1wYWduSJ33XIdiIEbKqbJ+ydEAEvylf0YQ1xjCgru4V+OEZ89EBKjKPVKHOt+sWR/Ewf1D6PQd8nqVEvSzSiLUqXrcf4IB1c0gEQZCbxzu30jxLm74miQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980932; c=relaxed/simple;
	bh=82cjsGYwBa/44oPvRJXugB0gEs2oOHl0BskXJkebdVY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=V2ncFh+TRjE7YAMVIUNVemC434sUrgHHff3SeTKBFWH/lOykNuN15aKa4pK42MTIQizBHQ5kT4rw/LEKNduczDiTZ2FDQL90Q70t/Us07SE2QKKVb7yKlGm2LGDQLchMmzfwjEygqwFl3WpObbErM72t5Zv/G/77v3AFKvm0ApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpMINZ2Q; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpMINZ2Q"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36c191991e2so920075ab.0
        for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713980930; x=1714585730; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82cjsGYwBa/44oPvRJXugB0gEs2oOHl0BskXJkebdVY=;
        b=UpMINZ2Qsokjbbh8Jdba41OzWIJ+Iits5BtPcoBRiRCuSkcQn6PIIR4YXtsf/6D9Yv
         SwTZi/mA9ZyUeQlgWJAOg303Zhbsc458u+pDXwIgyuVqmsEzm80b1PhkIS1Up5wEhLbl
         RamI1bpfHomguNEFhxcqM7mHf6qP1dF+V221+B1ZK0sTRdOdfG+1zxnx1Ada5k4gpp1g
         g6lx3MFSLWjzqtpzKafqcGtLyHVPpDVZrKrSM8omX/47dVm5UNOQ8r0cZx/oxgHOyxte
         byvr54h852ToehKbCsEdFjlvRZqWsCoxQa/eUSqbjQlqnj/dDeY86F1p00O9qbAQRtqJ
         Zj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713980930; x=1714585730;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82cjsGYwBa/44oPvRJXugB0gEs2oOHl0BskXJkebdVY=;
        b=vHaAnI+xYpeW0gKzW6N+yG2X7L5+r3i0Zp393VJqXC1/92I3O6On6znRq9/VJcoEiq
         MyUUSGUVg18levbAAxb9iYNUJUMB9I/wh64xK7V4uBPpoOvmFbm6LXgr9eWqrwojZ9WJ
         Rb0gsJuXBYNfg6HuJWdQ0K/TmeJBkSxWptV3ceGtLP3QkpxalFswrNZm/oI22Pbhg4as
         TXYYYVCfHcZOC0awzVhthXXQNEdSAioD4+BCE6cjc7Uwe+swuWGYWG1YTktVKqZZyfM9
         dvuuHpp/AC9JrDRASaD4KaR62G5oI8n0urbCedOX1p+xtgFyAbg0NE2alAMbQwsofjiX
         6PcQ==
X-Gm-Message-State: AOJu0YwSUNfSXDzGuhMh/H4SI4z4IUUuO6yyPG0IuFrwqFxp2QHZuYz9
	JTFfWwUAcsTKlAULUoBRFnHFe+IMlTC3r2EzfFJehhUc85u49pG/NdGUGQ==
X-Google-Smtp-Source: AGHT+IFukJBDmVqHQftxlmwUvkdnZ2tVcZ5eNThKcjFPzCOPTjLXDV8i69Kp6sEmqeKdDWd1EM4sFA==
X-Received: by 2002:a92:cd8a:0:b0:36b:1868:fab7 with SMTP id r10-20020a92cd8a000000b0036b1868fab7mr3679333ilb.15.1713980930321;
        Wed, 24 Apr 2024 10:48:50 -0700 (PDT)
Received: from ?IPV6:2601:280:5e00:625::b10? ([2601:280:5e00:625::b10])
        by smtp.gmail.com with ESMTPSA id kw22-20020a056638931600b00482ed278935sm4279551jab.8.2024.04.24.10.48.49
        for <dtrace@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 10:48:50 -0700 (PDT)
Message-ID: <dcb1055e-c612-6229-b7fa-6eb0e5e59d92@gmail.com>
Date: Wed, 24 Apr 2024 11:48:49 -0600
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: dtrace@lists.linux.dev
From: Elena Zannoni <ezannoni@gmail.com>
Subject: test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

test, pls ignore
