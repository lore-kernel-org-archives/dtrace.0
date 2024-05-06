Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0D2BAE5
	for <dtrace@lists.linux.dev>; Mon,  6 May 2024 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715027622; cv=fail; b=IZmpMz39sLah7YPApp0+tUKPByzXF3/zU0DqrRkeuDIbvi70BctoW8DM2LQN8260BuNunXzhnaxiZYxoVUXbz9L+x6FHvGfBbbbvAUJjnkcPNaNonr+D4v1+5S9x5BEBdAyZuI+4Q2kVU5kURR5SpTnC71so0XKYEwbryRVuHO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715027622; c=relaxed/simple;
	bh=15wm3Qwy1O2GBcQ+1LC9YYwXVpv/xd67bG62x51do90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ls5tmwm7oNtWVBm9r9txu+BXsZvmz/Le2YxqhBOa2hT6s62WZxzT7qJ/ddoisg7xeHbLSS8EsE0LEvv+EPgyIJlvbpSGktSmTQYqOjpccx0/RFs5pmlDC2Z9BU7RvM03/SjAisGsW+3Pao6ClXGqxwV4YXQ337FJI1GaShnhzgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NXqod+SQ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0JXknvkJ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NXqod+SQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0JXknvkJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446IaBqf018818
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 20:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-11-20;
 bh=jtDElh9T71T1NhI5IgMC9RVP2a/PYb34DF6yLAS9T0I=;
 b=NXqod+SQwTI3VlXY4dodXeu737pUHswma5+aF7Fl3pt2H01lZs5kDw2U++mx3sZEXU9E
 JhnWhReGVJQzQkzGsw0iCXcXGcQokxqURpExeINLyqmm2rrPQq1zDgqH1OQK61AEyGaO
 1z73GhFQfPuMXPsugHIgk0TGXErFfK8j5GDALeVhqVaIhUlwWek3AUaVn5xlZfmk8Xwu
 otDN8Dqb9z91ziYpc6U6L7zte8+R+9QUt666XgAu/RJKoAy+4I6lUq75hOsb6tparH2T
 t/QAYEjfXEI4l3QMAoq9KlCRr7t5RgMl0c4X5uvLjR3vkOW7mguvat4QnB3utohtE2O2 mQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xwbm5khyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 20:33:40 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 446JmAOD027687
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 20:33:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xwbfdc52w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 20:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Woboqbnaj11WFVvMgcjYjQ9L3quQw4A2/7XEs2oOFoEoZepPgOz6xwWQLKYZIsjsu+gYRw1D9yLAMo2BSciCJchf1sHsKr0LokZTwT+IMZX4m+S5w0ZXSRSDC1XoC8L1KWMCzxjnD7rAjRZh0U7eMeoXh4hPvAl7JR50jpOr4XmHtIs8CN34PzqYSFlTkRG22YWjNDdp1hYqNenDAQxIB9onIU7VM7E2IGxidryZsGX10dtzVcOyKrzSHYo/iMc8Fu1xf64dpxqQsa84HUCAyPWXBmR9yH0Tz2ET/GKg0WiR524rS9CYj8HOyV3ps/Wzxk1v21hl4V1TP/es+XPPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRO3yEMbv6m2yUnilxhtNeMT3apEzMh9waX1ISJqSZ8=;
 b=acXquwgOxME/6hh8eGAebVVuaKahFn/JwfrE11GerzTlRVpMAPMOvEvOe/hjooifQ9pEK2bqc5eI7mIuXCdyoAiqRBsrdDfPy2imoQfgf//v77OM8Cjzgfx8fHjcbFz72bsN7MjEZ/NnDd06D/GSI28lZF2mTSQuqGHAMS/v7z8S2mEKMEBXQQNYW4j6CP6hbWZ+4HUTdbk8bJ8JfvU9cSY1wFUZbp+1fl0tkEPkWfG4jAjSTkI78QPrhV8qNBOVTCXJlCa+4AW2lSbqrrTzBGirp2m4F+0uOkpYwtv3daBKcxvUpolSCYfYcELdBA/J61n/GZH47FKdnlgsAxKOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRO3yEMbv6m2yUnilxhtNeMT3apEzMh9waX1ISJqSZ8=;
 b=0JXknvkJGX6J231ztXaL3fT9QaE1EYKGfk0LcB/fato9zBAuYBkAVl/+SgkB9TFcnCNbyjWMvo46UF2zFJo6WtAY6yFjOFAkqmKIBbsBdASx/ojilDKXp9hvvjUnr+H3TWlb1Tb6fJ0HE7Co/v9bO8wo6sukl9y8qHMrY2XhvHE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5139.namprd10.prod.outlook.com (2603:10b6:208:307::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 20:33:36 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:33:35 +0000
Date: Mon, 6 May 2024 16:33:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf: be less picky about the content of bpf_helper_defs.h
Message-ID: <Zjk+ncHKBG7FyPU8@oracle.com>
References: <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <9a7c6e07-fbb3-158e-4fa4-e6ce695b316c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a7c6e07-fbb3-158e-4fa4-e6ce695b316c@oracle.com>
X-ClientProxiedBy: BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: b620e051-0453-49b2-5450-08dc6e0bcdde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?oM+ccc38Deq4rXAvCYY1oeTE5hQE5MsgXZQOmx29cmmFOh0xeQFvm0rJGm?=
 =?iso-8859-1?Q?v36T77GJ16LTAhi3yXw8Q349rMkZsr9R87P7fwFXKrKesnSIegbv6i/6OW?=
 =?iso-8859-1?Q?Pw9twvNOiyR0ZSE4O3ltaGo5xgp/bKQTWfN2tFLpy2JSlOPcHJKnubQGl0?=
 =?iso-8859-1?Q?HGXscBOgQZwk/UdH5mzUvt9weXBds6Ts0FRS8pwMH6kCb5XSyxVYTRw1bS?=
 =?iso-8859-1?Q?euvmvXYGplU/ed7Rt5dwAqCKaNUDuNf8UhV8MFndPnHwsXNO2LzA8B6Egw?=
 =?iso-8859-1?Q?8Ufitnw5i3h6ffTwq6Y2qjuIu59I/B7/1E/vRhpz/R53Yi5VGCi8hm3I5X?=
 =?iso-8859-1?Q?1wdJkCDeC1mBYKSuljBDJw2yfcj3aKTdlBtgSFubCA32qFEOVZXJOazuKu?=
 =?iso-8859-1?Q?/ilPpWDPXWujrpYL7JUQ51lZxg9J2YAdP5/4CRU2QKHnkUeF+Mn3qjfTCb?=
 =?iso-8859-1?Q?xB+d1QCSCMRCsftyzVcYuFh1AEtHTu6TMAQqbBXO/xOERJBSwRhDsHS2NN?=
 =?iso-8859-1?Q?m/NcJ6kftRBioxBEOT1Mod1Yy+MVH0I+djCnKfD5Ht4KHweRTOzR8r8ip3?=
 =?iso-8859-1?Q?h1YN2oT190hA660pGIMGoEgLkT6LqCS9ad8FJKT23Ew0OLJCCaRh8PFR6L?=
 =?iso-8859-1?Q?WFRkeKVHgu32R1t93U1FNCNHB6RiWmKtPhqGNhfGDjxb8azK3slor47f+1?=
 =?iso-8859-1?Q?7JHBoujoJkrbwza+7LPt1ZQvaTTkf8olwfFR79iF58f/rhw/jY5DG7q1FN?=
 =?iso-8859-1?Q?bvKWHHZyymWYu9bgwx39Wvdl0z1d4A6VCGE3cSzOTnGmc/gKDmjm+xW+db?=
 =?iso-8859-1?Q?/erhamuVII+2kgY0+ZtQY+Xs/NBRBJ74nu40NnSUG2JA0iB3WlqhGOq9fR?=
 =?iso-8859-1?Q?xIqQHptJxn6DhsNRc+/LzM4L/w6IlVMwp5YwD5f0T4+eexwPUtHKJLbG5u?=
 =?iso-8859-1?Q?lMM01ux5+VqATxEm6PmzSjdBzRdSYNaDI+nxYdZUTKvEQettPR9xbaSTaX?=
 =?iso-8859-1?Q?ysN4urNlkVuAY4csNXbjcb0WFIjqHQZ0vxpSp5lByWdiujKvUXUmSGQRck?=
 =?iso-8859-1?Q?4gbW9FjKI/IJDjiGR+fQaW0Mtp9JU85d2RauSZc7yuCh+Mm/YbSvjn9XZB?=
 =?iso-8859-1?Q?Ry3EsOmrVB7ETgz7J7wqxJ1gAliEUt1QBzJqo7DA2jJ/SUlgxZNcLBk/YK?=
 =?iso-8859-1?Q?zMoj64uEwcJuzIdMOxACG6kOC636S+lpYhEgsuuGuKSoiGu2sUFB22B3ft?=
 =?iso-8859-1?Q?hr9LjivXNwcL0NJvTG58Q8b9mvZ5ImyNfk9yotVdAeAexLRuAVVc+A3NQ1?=
 =?iso-8859-1?Q?xkQjA1ozqBcPuWbsi3+tdP73qw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?5qfuaMMoSm9gEvdpnigdY/SQqGElWY7WxeoX/eHOOzh4UF/0xCaQdHvENZ?=
 =?iso-8859-1?Q?1K8tvBdpP19vgFs/ZX+sPL2ZMzsxICOnnHGeNB+iqP4dRwwLd15CWpt9sc?=
 =?iso-8859-1?Q?l9okuQGXN2R3O+SkP3N0ackvdAV6QCvUFvdrRm3IxTQ7flS4FR9IPZSMlW?=
 =?iso-8859-1?Q?ot4iHI3B/eT+ngp1zhlC/zWPYdN8br8gDD9rMNCLHU3fW4s8HsO6ARyX/5?=
 =?iso-8859-1?Q?2inKPSgrXbrXODEQzLL+v+YeQBRAnNl1bJehPtxKNLd+RXTa/ARIeN85MT?=
 =?iso-8859-1?Q?m3SiDOnBryV8hB8IUvwY4j+3Oot18HFEEWSGD/o0/elt17ng8tdABV8DEZ?=
 =?iso-8859-1?Q?0GNWJvGRI8f1bhibBH1EWBNq8uowDsUCDb7lr96aid/rghw+pwd0qUMB1t?=
 =?iso-8859-1?Q?z8pZ3EPao0mMWyvr2/irJbiBb2JP8eDqiy5Nq+kBXJv62JzAO2wEcM1uV5?=
 =?iso-8859-1?Q?+7fiYvPZuBuoyqJqGet2RjsL+6LS2BEESJIjMmgonkH7IcJxrCzTEjKxVf?=
 =?iso-8859-1?Q?Du+HTcuO72cuLulXbfiAUDHXag9s4Gzo/PyfsTFMUJMxamCXB7qwQaZCoq?=
 =?iso-8859-1?Q?Q+DoXO0pmuY6Sh3ywruEOnmRfGj8cjyyZ2JeYNpF+v73yP8Pk213jYIu4N?=
 =?iso-8859-1?Q?6xDFn2ul0xaet0YKPMMIykEPFcKYaILnDN6N1MhjUr9HJ1K33JPn0SCYYP?=
 =?iso-8859-1?Q?s6LG8B84qQF0RszMvg5J4melSnyrg57QfqbMRCTbgaunnVMOUic1CpFDa3?=
 =?iso-8859-1?Q?qWglAT5eY4PnioKIdlxbVkuYYquUYeWXf9egfbVNdkxBtwmKK5snn6O3Jn?=
 =?iso-8859-1?Q?LUAQPdwb+QF9GxHk/vqf66naV3FuOMJi0tf2u7OYKuutjBrE9OfFm2BwlZ?=
 =?iso-8859-1?Q?HVvp8psAGg6GRYVJ23QX6bc8eyJInZDQ5oSHK1FlGtsFXONRih+LIBOvVq?=
 =?iso-8859-1?Q?X5nIkpb9y8WpzruVXXV2hDDmIn54/5rxaoMjhPm9OFL6KSMibyX7EtQE48?=
 =?iso-8859-1?Q?tJOs5iPnlwmmKafy6eE8ArNtpfYWkTGDdEv0Vls7qm+SFISNrziiOruum6?=
 =?iso-8859-1?Q?w3J2cQtYqMGu33TzEBCwvygVx3sba1nCHY+XbR84hpwFtRnMlVzOPfHptG?=
 =?iso-8859-1?Q?6aXmInP0X+wqHNDJtkAlIWxyW6W/pMUYYnscP5UJc897NgefiNF4WlF7hh?=
 =?iso-8859-1?Q?jUuYH27gbO0UVTzdVPwbc2BJZKfjUB6EaeRVpQBjvSnZ4TuoclHS89YOAa?=
 =?iso-8859-1?Q?i5S3OaJIQXfTmGtR90TIj9geBywyzj7EYBzps6K/YsvlYL+bbzm/gpDdr5?=
 =?iso-8859-1?Q?lDwulz8yNDFRHTlJoAMWvXnoqT5zOEkrJgIJpIqfx7X2bb5zbuhe9pst3I?=
 =?iso-8859-1?Q?PgXUXbVHeBG7R1HoM8pvDxr+x3AJgzURtlLpMJgQkyOUUSFo+Dx5+Q5J+p?=
 =?iso-8859-1?Q?+8IfUzpB1oChsXHR+sPaDqgH6BH9hpPptAXi6Pst1QTqSo3/FH+y4+lP1m?=
 =?iso-8859-1?Q?4F85hd62s3rX8FPC1HgGOK/A3bIga1fxYYJTU+ySwI6KxR5NizkngepXo9?=
 =?iso-8859-1?Q?Hr6lS5nglWiqCXdT8RF7kMjbXJ0F1UTXfzwKl7ChBe3PlIH7rjlplIWkCl?=
 =?iso-8859-1?Q?DHNLcDj8JikNfH8s3C3qYNlbgXp53j5Mov9f3sNrUmNOFbHPDrIuw79g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yxm0ErIyUZVZLIZBEhMOHdA80esWCnfDllnSB/bDUi950O8tzrWVwUzHaUncgxYD3S7gnupYQY24F2rxzvbVhkhxTVzZVf0Nv9Tu09zviCRfE127a/U3ePWkSq0x8lJ1bxl5mTtWFocKL0DZ4iOmXB9D3NclKmCCO90Pw3laGRXcEFcaJSnyhFTJ0BBHbsOD3Trqn0uLHU50DP4oXiSET7FfYTFmNcEwDCvb0dFtzsIS4gjda/HPEIvwb2gpO2Ohugol56dJzejxX4adKXEiTPmLiuHqwInrQiLhvnnHjOk7oB49c7cfX+fDGD1vL2rqyQWoPP4bR1p7EykjxF3eJd0XvGvrOu7YCTzIQ7OKvPNaZraLWq4Qv76pLo2YcFixOjy2wqN00Ho3zmlJjPaEg4wSPYjMJWapZS0N38Ed0oDAwfHmA7AWtg1nFyyovswJcCW15zTWG0dUCoyfop4kbj3jdmwjNw1Y9EqlosyN+G3qAI+0K0FrkMOYxAsb+OFOqeElZpKd+WyxDkUFlwgwUQFCEIxZXG4lIwitq6g7wTaXilJfkrq88ScRzqZGh9Usjrbjfw6PTgkmcjfXyjesUlYXpY5YD6gcKNjUN44dSwk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b620e051-0453-49b2-5450-08dc6e0bcdde
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:33:35.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYpjUMzvputYQONqygHp5nSVFwAAGAW8auLDwTcieImfPGmkFrml1Xvmiq3bh3Gei9Q7fw1jOtEJqLrJnTr5ejr3z25lNdNhqjMRpatZ2sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_15,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060149
X-Proofpoint-GUID: 7Ae-oJY6Yv4jwUeNXOFiSSVm2RtGLZry
X-Proofpoint-ORIG-GUID: 7Ae-oJY6Yv4jwUeNXOFiSSVm2RtGLZry

On Mon, May 06, 2024 at 03:43:19PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> One possibility, however, is to regularize the input line with regards to
> spaces and tabs.  E.g., start with
> 
> { gsub("[ \t]+", " ") }
> 
> Then, subsequent string processing can forget about that \t stuff and will
> presumably be that much more simple and readable.

Yes, but means we modify every line, which we do not really need to do.  I
guess it's one trade-off vs another.  The gsub you mention only really helps
drop \t becauxe you still need to account for places where whitespace is
optional.

> On 5/6/24 15:05, Kris Van Hees wrote:
> > There are small differences in the format of the BPF helper definitions
> > in bpf_helper_defs.h in libbpf headers.  This patch allows mkHelpers to
> > be more accepting of these differences.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/mkHelpers | 15 ++++++++-------
> >   1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/mkHelpers b/include/mkHelpers
> > index 1a7537ca..dc5e62c8 100755
> > --- a/include/mkHelpers
> > +++ b/include/mkHelpers
> > @@ -8,14 +8,15 @@ BEGIN {
> >   }
> >   $1 == "static" && /=/ && /[ \t]+[1-9][0-9]*[ \t]*;/ {
> > -	match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
> > -	id = substr($0, RSTART, RLENGTH - 1);
> > -	gsub(/[ \t]+/,"", id);
> > -	match($0, /\([ \t]*\*[ \t]*bpf_[_A-Za-z0-9]+/);
> > -	fn = substr($0, RSTART + 1, RLENGTH - 1);
> > -	sub(/[ \t]*\*[ \t]*bpf_/, "", fn);
> > +	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+/) > 0) {
> > +		fn = substr($0, RSTART + 5, RLENGTH - 5);
> > -	print "#define BPF_FUNC_"fn " " id;
> > +		match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
> > +		id = substr($0, RSTART, RLENGTH - 1);
> > +		gsub(/[ \t]+/,"", id);
> > +
> > +		print "#define BPF_FUNC_"fn " " id;
> > +	}
> >   }
> >   END {
