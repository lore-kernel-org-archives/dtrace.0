Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC81E3772
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225788; cv=fail; b=cuzNLRRmk7CTV1wOalnajNpzQYIl/8CR5DBjm6rKHBJhcoR0nvY75FxLPQd2JRWwCTPGWdKVZ+aD4QOk9JabeYlngwow8qOr8B9Dv3WEWQumPAABKYOMBy21qcDlRAMqD1g3pUphThwvBdmm9lD/XwIgbSMZ/hFpiug3nHvHWkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225788; c=relaxed/simple;
	bh=Q3BEuAtCn6L0WqVWbORq6Qd8iMJMWMoj2GWd4oC4ZZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JI2yUhFK2bpAnwWAGr3WCzleafZiDHefFOxL9axY0TCdvT+kMbwLNfmADeITcKBoCKz8EUZzIBpDOEci0FZPxC/PRFDeWhGRP3mMYSrTFLiw6NfKW5yy1pAf04i4LIP7QI/suTFFM8k8Zf9lsQOsk7pZuCXz24F2jAC2pi+j6Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZUl1UZqg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uPrzVhJJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZUl1UZqg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uPrzVhJJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XZdZ005031
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fldkhQE+izhlo+qScbEHDn+lX+gGjPcR0olMLwPKw3w=; b=
	ZUl1UZqgHF6+SY3D9jhsP2kN2OGNX0f0PaKGsjWAKGSyxrw/6OigdefckjmQiNoY
	rhjasG0i/t3v4mpquGEnM60Mlrv0YepoQafhCagbkLB7o71JjiEd+UUM84lMf/Bg
	En1uRO7EiD3ZlEA/aHk7C3C4OH2hmAmkIHaW0kB2mHUsit4Zkmvv5fCDKDBJ+d06
	e8YiziFKQd0z/ZvW/qBDkSumsfLphPfxyYhNd0MmwLDdxNX53ZuEexjSrmFJw4xg
	PMybM9oSJ2mRmDORe00ez3OPjywpMFhirSIfJsU/dMyGaj9C8qPzjmOnoEbAhTdC
	53Lw+rWZeLUM+XiA08BgPg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg25vv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3A3xqr001943
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s57tb8t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk5JJJ4otBoK5gVonPT9L/I1BEcIt49mimkvkORFgnCR9bqN0KUhsMlv23Nh7n0lxFBAG4i4vGCCbyvQ6Za2Ftje2ZBC2ppNMv3BMRP6+b0dweT1U8p0x4TbT2+KPsj1UFl/eL/ggacR0v50Gt6O+WRGRlpVhKx66Cg0P0as51uD7z2RC/JP1KS/pu2WsYj2Qi1L/hJkyNyCnLZz+E7kNjzqtCoowL0RuJ/jlW7jTDb+97mPLy4+LrcqMs34nAOuot+JWBJhUclQ/76Wc6GcdEW2uIhtUj9lEszCmjGdQW5altpWENhY5qkkTpI44EmFH0a2Fxj+sXAJxIS2ZQS+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fldkhQE+izhlo+qScbEHDn+lX+gGjPcR0olMLwPKw3w=;
 b=YhcPDAAOEPcxP6ac0+0GUxHSQ/6nz7C1x+tgMYMkPjr7zoNOpP1W58oDPVcUMh+ch6+c6+wKAnm5RrKJx3MqB0Fun+M5HkEf4u2nNIXVITQ8D55TK7FUhdxOaCI9rP1k52ni2ZYrb+qRk6ViR7KysJSBRmnucrfU4I5GKWdFVdFRL9VXB3UGGt3VHnwm1LjmhAU9kdBTyTru5u2g1/aGFi7zSBDkyfFnyh9Ntwhe9Y5Ke7f1TejjQQNVK3W+UUz/5Om60zlGMAFZYhg2+ORU/oNTdxMLZdrN2My1d9Mi/zZHDPuB7kNGmDq4hrqsI/9yagD7UxDYJskJTfQtuqq+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fldkhQE+izhlo+qScbEHDn+lX+gGjPcR0olMLwPKw3w=;
 b=uPrzVhJJhscdEl4xWICLL+PHR9SwhjKSrWRcx7C4rwpXwk1pdZ61RJZXMo5ZC2P3sIg6btjcTMBrUS4h4t+mf2mBOi6DhnlJazy8RTGwoZFrPBRAHa0EZtrqdySHyf7YkKMKtAcTuqRw7fyFVm1A1wLV67vKT1tLiZTmD0CJR/g=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:22 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 3/5] libproc: debugging improvements
Date: Tue,  3 Dec 2024 11:36:08 +0000
Message-ID: <20241203113610.75104-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20241203113610.75104-1-nick.alcock@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 0400115d-5dad-460a-71f9-08dd138eb63b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EtxfYyFwtXu1vb+0e0uPv3mBmiX8HxR0XmtsrpiuUypGBiBM1dq1MPsHQgxb?=
 =?us-ascii?Q?pOpEAcpPhHfqOrgiUOYQV3EH0qnr5UWZfMBdGPUoXfb/pfWTCkTInzuJtUL1?=
 =?us-ascii?Q?TRo5uCBUmbMiVlXAkzhjfbWLh3azLF5MU8nRqRkrC5WlUAtD7hdPkBY9F3+W?=
 =?us-ascii?Q?zodhMcmKfox9C/FBUKLT0+WQ0bg4M9Tpo3ST1sgeyUR2gUhmZRmQzxTc0Si8?=
 =?us-ascii?Q?ahremnN32lbnLH/asu2dZIyDKJ0U6zWtnVsyOxs5SYTWlS3TYstv3rueEbB2?=
 =?us-ascii?Q?ZjSdfwwp4RqksLP6FK+RW8j+SF6utKmOhcnMf0z98F0YX8Y/tV01O3yJNu3b?=
 =?us-ascii?Q?MuyqudW6VGWI/wGjmd72hcaXXuoZ2DO2bMyH1LnxwoVIq2VDL54XHF6FjQyr?=
 =?us-ascii?Q?8i+LzeZS/mXdQ7bpWOuOM0AzL8tUQ4P2lQut01qFB9CWH1SkOMz4emxZ1dcn?=
 =?us-ascii?Q?vL8ycXnBcN2sRB5ORl8MNqbI6CuupxMprkUl3qBkBEEGqgWXbO5v/9ei5GT1?=
 =?us-ascii?Q?kN8uDYwlGT5OMuKAhZsvbEBTsLGMNn66LuVwaEc0ntp6uW9TXAImmLlwdZQo?=
 =?us-ascii?Q?thdp3aKCY611IMM0jEELK29ONIVSZVJ3miAK95/wkPlzipHADCsrCA6ZbTTQ?=
 =?us-ascii?Q?0hlWElm9Htxw2fVDLQy3P2jYtM36FOrMx0a6AcgERQK4oE759rZZisK6H0No?=
 =?us-ascii?Q?ucPpSH+MourGpNvZ/abZ1g8JVf4T8sz8u2f3U+8ZIRR5yZVaLAP5RhNeCda5?=
 =?us-ascii?Q?ESakOgV/hB1t4j36Jbpa2DpE9sYEyrFmRzuUFvqcwYrLjlllpzCbLWP0RhEV?=
 =?us-ascii?Q?AJ9fn59pjmYnxRyj5P5n3HgCLvCxj4n/YrWs84UXzDSYC9tf9g9WVmeYrmBd?=
 =?us-ascii?Q?Av3+1OAxto4mkNXbDSUKcNW1MfLBVLqBnY3dwPMbcZEnEnfhgbVW/qZd2lZ8?=
 =?us-ascii?Q?2KVd8JBhHGembx3DEcuPjmSsX4LIpNFElDYUD1WiyP13YDDS0nj4WhHZ4RyN?=
 =?us-ascii?Q?FPhLraME9F6vkOzPB2h6gHtOw2QEDhMh7FnOS6AycpU0GBzFVhyYun1RM02z?=
 =?us-ascii?Q?aWeV7oBuqWabuTizZyUc3fVF1ihkz8N81W3G/VwxncB2a/Uj/TkQ66Mv4Ref?=
 =?us-ascii?Q?S9pdPK3Z4/xZHibczoHoIy6I7lPIJB1pJbqkEB2mEob2LAGHhpnifhY4SMAo?=
 =?us-ascii?Q?L9b4dGbHb76af23Qze5PQEBaeJlD3W5D2TKqM3+pQa4XDXxCSwn1T3P8PNfW?=
 =?us-ascii?Q?SxlgjgW6qPqpKwBqcEI+ckmBbD7fCI9d0QsDnkAFtgM8aE+959YlkCn36U1r?=
 =?us-ascii?Q?2b7bbdxvJtbLkc0tuQTTY+cpC0YXRTwQz0kLZz9hqveS/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CW15rukcNbf9vUI0HLchrnhryrL1qbwfKa+YvbyktkaVvYWjQwIeGNRC2Psg?=
 =?us-ascii?Q?DREXtfpM5b1Yvhqwd4bcYABRh0C2hD7F4YKVnphjViUKay1hcOWXrAClRleO?=
 =?us-ascii?Q?vYeGsGjnxXTMsU0uc9/mK1+xlr7pKUw6FnBpeYjTG6rI6SltJf1XObaConK3?=
 =?us-ascii?Q?80N44QZ0d8v51alRknbVrDImWFRjNJhd6Fjy7WS/WqG/M6sZjzPi8Wbx9D16?=
 =?us-ascii?Q?Y2kP2qtL294xc5xX9gL39RhtgV6fqxCF0TKsshZBVFaAcBwLQt4gDD/rK4/A?=
 =?us-ascii?Q?6hZbsNykajtpCq5a+073dw3UHEADgi9Hg5pTkAlYq6OnSO8CSqoJC05w6ANl?=
 =?us-ascii?Q?TECW3cYlW+AYwWL4qg6MDVYdpkEiIRtu7dIkQf2RLI6untrX8p2TRNCMs6Wq?=
 =?us-ascii?Q?SWECT1XLMt46FWQ6TRrUdfiii9raig1rB79Ptgqo3RysSeTfBRdO5SqeN2Oq?=
 =?us-ascii?Q?88QSlo15FN1QymdwI9oJFHTIgydtLZqRkjW1yb6S0plSFbFTmANYEDJHYO0P?=
 =?us-ascii?Q?hguEZ8DUIF1/UH4Sm/8qDKHpun6qemX+o3R6IfTCMtLOBU7XfARQbCl27sFR?=
 =?us-ascii?Q?BiG8oAGuYL/ttqSL3BRDvR90HEh+n66YWa7qbUVNWxl/FMoNjCw/sGvp/ees?=
 =?us-ascii?Q?GIp3P40T3PG6r2j5akeAX6nl9ByVUXsbvN+n8yQOjHRx+/lulJF5lHygTe8p?=
 =?us-ascii?Q?+XwEwcJBm1fp2EzHOFQk/yJI13rhGKBJmna1pxxoMJ1ePM/WEHqjrpI6MkV1?=
 =?us-ascii?Q?Xu6OISx6cjexIyLRwXxwUe1jOBoyXjMh9HpPS7l/0cG53JRxnUXAJdwQTgJm?=
 =?us-ascii?Q?ox3DeEBFcg/KARKyCYtPLPbceT/0xqtvAPXDXNZzw/iIzi+1vC1FsMrIkyVl?=
 =?us-ascii?Q?AcbxvpH99cnCBUsGHOgEPNOMa1RbyjICx5NQceNIvChfirR4fXSc8vna1y23?=
 =?us-ascii?Q?EeIvun18seasDVOwOhUhlVKliSki+fVuWzJynOCBZItppzzuoW5ke4ZL8s+/?=
 =?us-ascii?Q?RuBgy2o9vBUv4nJjJUHjDR1dWOt1U4Tn6AqJE+IMT8xMZyCVYNxMBV/l8HLo?=
 =?us-ascii?Q?HYEFdSmo7RNYWXWNpU3bjZjDGMPo6s22TqIY+zCpdfh13EgZnh0xHlVcF7Jz?=
 =?us-ascii?Q?B3XpvlOXXBmf9F/R5/IxAcHEoXULULl0MFyjoYqZCfbYDy+ufi1buAsn8jj6?=
 =?us-ascii?Q?sa8P6jMZJ+6zACSD+DJZ4X6lETVBOnrMVWpXCB7OgoYaHGCYvSoRQ6AJOGVh?=
 =?us-ascii?Q?8ZCbpYSPmuCzw5fS2u/KbJcJI3Q0Iym+bSBaBnlS3pBMq5ajhZyc78+CBy0Y?=
 =?us-ascii?Q?0LoIpPnr7FlNDMcqGm5jHDDkh8Q+OQr1WheSpOT5BkCNDTC08++kZM7O/nq2?=
 =?us-ascii?Q?UzX67Bn1B0e9MPWB8txvHVyoyp7xJvgzg4wCmpWk027cxdVNAn7A0nMrtHGJ?=
 =?us-ascii?Q?kfU74voHiu+Tm4jTxSVTlIfB49HE1i7Hh8jG3/uwhlsAjG0NDu322zM6/oOP?=
 =?us-ascii?Q?jFfdUWkwC6hhzqJX5R+Dg0PFvIX+MpFr3rVQfkJmHnmCsVe9T/E9ZpxR6zfs?=
 =?us-ascii?Q?nFeyoLNPV46c0xC3PWS4FpM9bnStG5tGDjegE9p3OrfnsDkilJnxEk+ACt6g?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XrOOqTH7CM0HjYUQOejSrp5rYrzqBI716/5n5VmTgsSKik4lmcO0bQXT3auABPzKkhTzJ3aBSvIGQiDO9rq2ELG5FYYLKfw53Ck3SWW1uASOqqQ9U4xCYir5JyA8WOM43JaTVwkJMt9obK530XAIbN51Xd4sfWb+tfMm+6guLnD8IaZEsMGoW1E4omBcOgEyB/F8wAg/EfQMqjkPDxA95GGUjS+nj83GXkrMJwROr3vclg3uN97Jgamcam3tQkEMAUA7GWvS1a21cPIfwaVHVblE6mswRIs2RdbhvyXuCL7xLxuqzXq0mxsvIovpmrgFBoyLRuvzWXj35aoKnWQtifkDQy6XHN5sjs4Q1+zmaM+lWBwKoz1ruJdLxENLnrGlpN3RM7WsRuKxKzLhPS+sCWHAH+FyACw4JcN2XDHDDrkJJ6LK7Qun5jigzqW4pVHX9K+yEysc6Y98upsIMDn/Rrl9MAzuOjWVDov+kjNH3qwvYld90Q7GQ9yinuIP8Ui0i8OJ0rDjExkztDDjLSu/g2hLAW00w/r6E8XSwfGcfjI40ItkqMDSfwdER48mr85iFzR9WJbwdJ2FEbRp41gBQnOTUk5vY7fyxYO0nTtShGY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0400115d-5dad-460a-71f9-08dd138eb63b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:22.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFMWYP2OPiaPM9vRsOSRo7I7WPz4RvjeYwPU8T6v5X0qW9ALuYaNMsMXMfJnkgSSe5rJhZYC3dU59KhInTnuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030100
X-Proofpoint-ORIG-GUID: PZOrrOgReNjym9LfOuUFiO6XEbxoAAs3
X-Proofpoint-GUID: PZOrrOgReNjym9LfOuUFiO6XEbxoAAs3

Attempting to track down the intermittent failures in
test/unittest/proc/tst.multitrace.sh is rendered difficult by the fact that
multiple dtraces are running at once, tracing multiple processes, but the
debugging messages emitted by libproc do not provide either the TID of the
tracing thread or the PID of the process being traced in too many cases.

Worse yet, if you do turn debugging on, both dtraces emit debugging output
simultaneously to the same stderr stream.  The interleaving is bad enough,
but very often this causes lines to be emitted to stderr that do not start
with the standard libproc DEBUG time-since-epoch: string, because it got
interspersed into the previous line. runtest then partitions that partial
line off into a separate part of the log, rendering everything entirely
incomprehensible.

So emit more PID-related info, including the TID of the process-control
thread; and arrange for tst.multitrace.sh to capture DTrace debugging output
itself and dump it as two separated pieces: if a dtrace exits nonzero, note
which one exited as well as dumping its debug output.

Also, when this-should-never-happen conditions like a Pwait() returning
-ECHILD happen (usually indicating that we were not the victim's tracer
after all) by dumping the entire /proc/$pid/status of that process to
the debug stream, so we can tell what the tracer *was* and whether the
process was even stopped.  (No impact at all if this condition never
happens, which it never should, of course, or if debugging is off.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_proc.c                  |  6 ++-
 libproc/Pcontrol.c                   | 57 +++++++++++++++++++++++++---
 libproc/rtld_db.c                    |  2 +-
 test/unittest/usdt/tst.multitrace.sh | 17 ++++++++-
 4 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
index 41b148e807f84..6ad57cc5f12ef 100644
--- a/libdtrace/dt_proc.c
+++ b/libdtrace/dt_proc.c
@@ -870,6 +870,9 @@ dt_proc_control(void *arg)
 	int err;
 	jmp_buf exec_jmp;
 
+	dt_dprintf("%i: process control thread %i starting.\n", dpr->dpr_pid,
+		   gettid());
+
 	/*
 	 * Set up global libproc hooks that must be active before any processes
 	 * are grabbed or created.
@@ -1421,7 +1424,8 @@ dt_proc_control_cleanup(void *arg)
 	 * out by ptrace() wrappers above us in the call stack, since the whole
 	 * thread is going away.
 	 */
-	dt_dprintf("%i: process control thread going away.\n", dpr->dpr_pid);
+	dt_dprintf("%i: process control thread %i going away.\n", dpr->dpr_pid,
+		   gettid());
 	if(dpr->dpr_lock_count_ctrl == 0 ||
 	    !pthread_equal(dpr->dpr_lock_holder, pthread_self()))
 		dt_proc_lock(dpr);
diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index c96a410b70b3f..a32a362eaa1fb 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -66,6 +66,7 @@ static int add_bkpt(struct ps_prochandle *P, uintptr_t addr,
     void *data);
 static void delete_bkpt_handler(struct bkpt *bkpt);
 static jmp_buf **single_thread_unwinder_pad(struct ps_prochandle *unused);
+static void Pdump_proc_status(pid_t pid);
 
 static ptrace_lock_hook_fun *ptrace_lock_hook;
 static waitpid_lock_hook_fun *waitpid_lock_hook;
@@ -332,10 +333,12 @@ Pgrab(pid_t pid, int noninvasiveness, int already_ptraced, void *wrap_arg,
 
 			if (*perr < 0) {
 				if (noninvasiveness < 1) {
+					_dprintf("%i: Pgrab(): not grabbed.\n", P->pid);
 					Pfree_internal(P);
 					return NULL;
 				}
 				close(P->memfd);
+				_dprintf("%i: Pgrab(): grabbed noninvasively.\n", P->pid);
 				noninvasiveness = 2;
 			}
 		} else {
@@ -719,7 +722,9 @@ Pwait_internal(struct ps_prochandle *P, boolean_t block, int *return_early)
 				return 0;
 
 			if (errno == ECHILD) {
+				_dprintf("%i: Pwait: got ECHILD from waitpid(), state %i, trace count %i, halted %i\n", P->pid, P->state, P->ptrace_count, P->ptrace_halted);
 				P->state = PS_DEAD;
+				Pdump_proc_status(P->pid);
 				return 0;
 			}
 
@@ -1262,7 +1267,7 @@ Ppush_state(struct ps_prochandle *P, int state)
 
 	s->state = state;
 	dt_list_prepend(&P->ptrace_states, s);
-	_dprintf("Ppush_state(): ptrace_count %i, state %i\n", P->ptrace_count, s->state);
+	_dprintf("%i: Ppush_state(): ptrace_count %i, state %i\n", P->pid, P->ptrace_count, s->state);
 
 	return s;
 }
@@ -1278,7 +1283,7 @@ Ppop_state(struct ps_prochandle *P)
 
 	s = dt_list_next(&P->ptrace_states);
 	dt_list_delete(&P->ptrace_states, s);
-	_dprintf("Ppop_state(): ptrace_count %i, state %i\n", P->ptrace_count+1, s->state);
+	_dprintf("%i: Ppop_state(): ptrace_count %i, state %i\n", P->pid, P->ptrace_count+1, s->state);
 	state = s->state;
 	free(s);
 	return state;
@@ -1422,6 +1427,9 @@ err_nostate:
 	if (P->ptrace_count == 0 && ptrace_lock_hook)
 		ptrace_lock_hook(P, P->wrap_arg, 0);
 
+	_dprintf("Ptrace(): error return (possibly other tracer), trace count now %i: %s\n",
+		 P->ptrace_count, strerror(errno));
+
 	if (err != -ECHILD)
 		return err;
 	else
@@ -1511,8 +1519,11 @@ Puntrace(struct ps_prochandle *P, int leave_stopped)
 		P->state = PS_RUN;
 		P->ptraced = FALSE;
 		if ((wrapped_ptrace(P, PTRACE_DETACH, P->pid, 0, 0) < 0) &&
-		    (errno == ESRCH))
+		    (errno == ESRCH)) {
+			_dprintf("%i: Punbkpt(): -ESRCH, process is dead.\n",
+				 P->pid);
 			P->state = PS_DEAD;
+		}
 		P->ptrace_halted = FALSE;
 		P->info_valid = 0;
 	}
@@ -1812,7 +1823,7 @@ Punbkpt(struct ps_prochandle *P, uintptr_t addr)
 		if (Preset_bkpt_ip(P, P->tracing_bkpt) < 0)
 			switch (errno) {
 			case ESRCH:
-				_dprintf("%i: -ESRCH, process is dead.\n",
+				_dprintf("%i: Punbkpt(): -ESRCH, process is dead.\n",
 				    P->pid);
 				P->state = PS_DEAD;
 				return;
@@ -1870,7 +1881,8 @@ Punbkpt_child_poke(struct ps_prochandle *P, pid_t pid, bkpt_t *bkpt)
 		bkpt->bkpt_addr, bkpt->orig_insn) < 0)
 		switch (errno) {
 		case ESRCH:
-			_dprintf("%i: -ESRCH, process is dead.\n", child_pid);
+			_dprintf("%i: Punbkpt_child_poke(): -ESRCH, process is dead.\n",
+				 child_pid);
 			if (!pid)
 				P->state = PS_DEAD;
 			return;
@@ -2181,8 +2193,11 @@ Pbkpt_continue(struct ps_prochandle *P)
 		if (wrapped_ptrace(P, PTRACE_CONT, P->pid, 0, 0) < 0) {
 			int err = errno;
 			if (err == ESRCH) {
-				if ((kill(P->pid, 0) < 0) && errno == ESRCH)
+				if ((kill(P->pid, 0) < 0) && errno == ESRCH) {
+					_dprintf("%i: Pbpkt_continue(): Got ESRCH, process is dead.\n",
+						 P->pid);
 					P->state = PS_DEAD;
+				}
 			}
 			/*
 			 * Since we must have an outstanding Ptrace() anyway,
@@ -2760,6 +2775,36 @@ Phastty(pid_t pid)
 	return tty != 0;
 }
 
+/*
+ * Dump /proc/$pid/status into the debug log.
+ */
+static void
+Pdump_proc_status(pid_t pid)
+{
+	char status[PATH_MAX];
+	FILE *fp;
+	char *line = NULL;
+	size_t len;
+
+	snprintf(status, sizeof(status), "/proc/%i/status", pid);
+
+	if ((fp = fopen(status, "r")) == NULL) {
+		_dprintf("Process is dead.\n");
+		return;
+	}
+
+	while (getline(&line, &len, fp) >= 0) {
+		if (strlen(line) > 0) {
+			if (line[strlen(line) - 1] == '\n')
+				line[strlen(line)-1] = '\0';
+			_dprintf("%li: %s\n", (long)pid, line);
+		}
+	}
+	free(line);
+	fclose(fp);
+	return;
+}
+
 /*
  * Get a specific field out of /proc/$pid/status and return the portion after
  * the colon in a new dynamically allocated string, or NULL if no field matches.
diff --git a/libproc/rtld_db.c b/libproc/rtld_db.c
index b6d33ce38425a..9eb63138326dc 100644
--- a/libproc/rtld_db.c
+++ b/libproc/rtld_db.c
@@ -1771,7 +1771,7 @@ rd_loadobj_iter(rd_agent_t *rd, rl_iter_f *fun, void *state)
 	if (rd->P->state == PS_DEAD) {
 		*jmp_pad = old_exec_jmp;
 
-		_dprintf("%i: link map iteration failed: process is dead..\n",
+		_dprintf("%i: link map iteration failed: process is dead.\n",
 		    rd->P->pid);
 		return RD_ERR;
 	}
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 4e53dbb992508..262c782821ef0 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -73,7 +73,7 @@ if [ $? -ne 0 ]; then
 fi
 
 script() {
-	exec $dtrace $dt_flags -qws /dev/stdin $1 $2 $3 <<'EOF'
+	exec $dtrace $dt_flags -qws /dev/stdin $1 $2 $3 2> debug.$3 <<'EOF'
 	int fired[pid_t];
 	int exited[pid_t];
 
@@ -142,13 +142,28 @@ DONE=$!
 script $ONE $TWO 2 &
 DTWO=$!
 
+dump_debug() {
+    if [[ -n $DTRACE_DEBUG ]]; then
+        echo "runtest DEBUG $(date +%s): Debug output of first dtrace so far, PID $DONE" >&2
+        cat debug.1 >&2
+
+        echo "runtest DEBUG $(date +%s): Debug output of second dtrace so far, PID $DTWO" >&2
+        cat debug.2 >&2
+    fi
+}
+
 if ! wait $DONE; then
+    dump_debug
+    echo "first dtrace exited nonzero at $(date +%s)" >&2
     exit 1
 fi
 
 if ! wait $DTWO; then
+    dump_debug
+    echo "second dtrace exited nonzero at $(date +%s)" >&2
     exit 1
 fi
+dump_debug
 
 wait $ONE $TWO
 
-- 
2.47.1.279.g84c5f4e78e

