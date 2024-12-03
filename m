Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1F1E3DFA
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225793; cv=fail; b=ZC/2311Ncx3m2fe0oqizAR9AOzIRmMs68PAiqXvsj3zpAebs47MphkJMXoxd48J2cLSx5gPiD/hu8jdTUN3QvW6Tt5JYDcAMkCye4/V7e7O763RIKYKZELylQWDtPYmwK+oTSwQ3yArh1M0XA3L3UhEM7rhpgxWPOvPcOy3v480=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225793; c=relaxed/simple;
	bh=NfE8wx5YR/x+17gPTPw9OLErGyvRUxQHzU9pKvLQv5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jDJkLwLSVt9/nnuTqZaAbqA99A1jUXCY1CzU/0VOK9lGr2WOcVrgQgd4EH9IqYWFfWKZgNRP9Vg7AJf+B2hp4TQm+WoArU7CUAVYhoFYpEIkIb4HdoFpHI3uGX3XdFIZreSCqx4zwfw0BnZB+/RoIYqG4UImLYqie9V2KEuVTpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KRzI20ZU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TQUqKJ8Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KRzI20ZU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TQUqKJ8Q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XobR002772
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=kvxz/zsPjttsDSw9zC5x6FO8doafdeCvLf/ur5lsF9Y=; b=
	KRzI20ZUErrmgVRWP5tmPWk9NFjDHuiFBDO6eOZQgUKaZ0JH/xjmvwspML5RiSoZ
	JCd7WAE3rdUf04was1X+5w9gRxSywv9HReM6Xr+GLCMRk9gJ8pTVhB+kd0pFs6Fj
	/EyxHGzO4dg7vRWcMe75iX4S4u3hGJf9m4H8PY0IDX7MNs4ofhquxVR116AD16y5
	RH4DuBcg6Bwnn+sS4LxtQRmCFDd4cQTv5oqt4+Zg1fXfyIEwER88/caTkJ7WpOVU
	8hz+nQSTRu3Mim/5Dz22A+jO947Foysa4x9qTMJqF/mk2TnsDwSLzBpbEz99xSVF
	wDNEjcWepxgF0QX01JjYfg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tas5tgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3AkBQT039084
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s57vrun-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgpJTfRqBafbYJ0/nfxPLO3vp/Gr46pya4y7dyQzP4hHlNUKzBLLEWXXuLNtLEGxRbl7+FsiSoXIntdIiQd8OnBS+FbOiWAorg8Q7PDVYbfJ5d50yXuYzJrWruETXEBwVq3shFUo9gpr6ME5OdGzNz7qppHJA5zuQN8Z7VPIjT2UUVc6Q/AcdQ2aFaJ2PoOR9nWXucdhYnKvpkOimEx5x5OIIezDQ432sGkPg7eOW1yr7Wn3sk3hB694VxLiRyX6qYQDP3w4FpPmSeVQT02v5EZ4GfHRUpxn9Al6Zxyt37VyX9e/IfCV8R1VRj5ZQ5SeGNWeopu+KZUxrA8BUamVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvxz/zsPjttsDSw9zC5x6FO8doafdeCvLf/ur5lsF9Y=;
 b=CS3nDHVYp8ULcpzE/VA6X952FCnLECKu3vV9JzrhG/sfsbD3/f9IW0w9Z3GzbRkR/NrFkyUumDeESb4P3fNC+m53hiUOrCMMMa1dQ40NWRIW+bo2PkgOG5KmFhDu+uLehym+zzkRCT0s6Omyagf1C+dpSrXhM8FoXGfdXVZCcCRe+LyYgQMR1CkCDlP8pzRCMximcbLoMQ7TTIdDXaxpP8q/vg10UeU7QKe5FNH40XuECN/wTCehqI5VwyNQ0I9n7cCHIuy4R78sUx2dhD+FYfvPbiXGwdk8RrFYkcFHcHD5bo64SARnJD9sQGanLYEVzzYlGfAnjSPTfcTq1RLhCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvxz/zsPjttsDSw9zC5x6FO8doafdeCvLf/ur5lsF9Y=;
 b=TQUqKJ8QM9OBG7jRGjFIpRJcH+hJNveeph2ZDnTQKbk+MTcTirwcg0dZ27mbJWRjkiwcD/QstYfvgjwjj7rSJuJWh6OudEm+5JN5RpheNXpdODXMoHqp2x/iSXtVgFAwy29C2fA0G86zOH8bSI7ul2qbinY+GYHDTpFmln4WpC8=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:27 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:27 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 5/5] libproc: drop Pgrab() special cases in Ptrace()
Date: Tue,  3 Dec 2024 11:36:10 +0000
Message-ID: <20241203113610.75104-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20241203113610.75104-1-nick.alcock@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: b53e5255-8823-48b4-090b-08dd138eb91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FFW3ChZLhIFv3S+23S9Xm/WRG0cBdaUTcwQCf52Yp4xGhWQKdJj0VKg8RGkT?=
 =?us-ascii?Q?wdZb+Z378bz+qHUW9i1HkYgt+WITCp5PTU+UsoZWb3Ylz/JcRf8C2gf4JXeW?=
 =?us-ascii?Q?mpLcIcjuU2SZ6eAQUzZy+CSWpHCm1npBo1+V4Upz0OmKWWa63+kR4I6oAArJ?=
 =?us-ascii?Q?jeXZ4AicXXAibCbpQT5eOU73H8J2/U9qIEORW/UescdLoYUHOCSiEIfs9XEv?=
 =?us-ascii?Q?uX2u7w45+eTasSUtNOg1DIeSYE9+ac9Ef2au2YsUSaGWYmM7szQCAs8mEAg6?=
 =?us-ascii?Q?X7+WFW/J/tX2blDxQUEFWVAI2W3rpnFhmBjIt04g9D9khQOvkOF89D0stTBK?=
 =?us-ascii?Q?S/mum/elLW5RXgpC64+40dR21Mo+E12ugs+QtcI+GtGoNWa9vX5ALrDX+h8A?=
 =?us-ascii?Q?HtJsPwqTuQLJxlzGcU2yARxa5LP4Ki3XsmHhwSkbRvFaNKWrh5mbxZL3oYFF?=
 =?us-ascii?Q?3bamSaNDI32iVnU5jtC0B/KL0GZCy6zrqoP4AyFbX0OpFXtloEsPwzsih6h0?=
 =?us-ascii?Q?CLna2SVR1hYNxjRKy2x8RCchoraktav0fwWnQqLbJVhPrVak8RXx7eFTWSe1?=
 =?us-ascii?Q?fgwuiQQi5cTO0iZl+DX5h006iG0CjcxNBF/OCDQqXokCC1J5l0pCqiF04HEk?=
 =?us-ascii?Q?W0piiTX0OUsHBLo95WH2NsZb4U1RKTCIc3BLbOuOFVFfcoGZ3CARCuQXt0S6?=
 =?us-ascii?Q?K6s81J1Ibd5wId1M6ZiTLbYFempwG6z848g+Xy0tW/jm0GQHaqS/r2iNycMn?=
 =?us-ascii?Q?/32VfohwVbmnbOXGd5ZwJCQxI5Hmt8Obtmg0C9qo/bxeOlziRT43GQGudLA+?=
 =?us-ascii?Q?aK41Fdbn+g3/dtVGbNSV1UEOtzE3JHR+g26HQSBOQf9a2YIovbZ51Q7zWWES?=
 =?us-ascii?Q?I0l5/gwIJExCM01Z25mdP5s96ghEVwnG2Ch/wyEmrnBfEDtXkA+yeywtXeMW?=
 =?us-ascii?Q?TJ7jvy6wSIHbyHMgIdxQTDmoGn9UwylJ102DFSeAuj6e/dgMGFgAdXUzQSvi?=
 =?us-ascii?Q?jQecS2tScTk1zdILfGH7GPDk0a02aaSeYHHL8Qftty5WSl9JFyd2qS3uZi0b?=
 =?us-ascii?Q?bw7rGqgzfBwzRF2Z0tiAduAebAPAF3fPo79A8Rx5aowyk9aEwb0+dzhaHCcv?=
 =?us-ascii?Q?Wk4En9tSfcGcpgVhuHuQM6ZuAEuWd9jKL/81DKY9LNGWSS4llx+GUp1N+T/J?=
 =?us-ascii?Q?QegEJXOo3NI7TPLvlb1EIhdjHcrImW+Dq+3v4ZGmxZG3/R9FAqOkJ78DSMx7?=
 =?us-ascii?Q?mhsCtbRWVPhtOqePOj7vhKmRWhQGXqSQxOuHHQiK5GrxRr/zLaX8aK8uCpPD?=
 =?us-ascii?Q?7sY67PVnXBP7OlR4jTO9d0CakK6b1VDE7TJRsd1DqXZUYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A1mb6sC7EuRMsGSt6QParUh3rFws4Q/w54Jn9GpM8pjW3jwJ2ETi1kCfA+qP?=
 =?us-ascii?Q?XCdisic7Pe6/tLUgmz2c2dJkoElpXm76ehQ3we2YyNZTUAtLSH1oSONHL6CP?=
 =?us-ascii?Q?V3EeNqShmLkuOubeQkk7xFoeNIX9EQt6VAmgK9NZFHL3+k0+O3kr0nWCkTno?=
 =?us-ascii?Q?bSnv0gLMVbkYak310ne/ZcTj3i/hxvqWA0MudoY9fubAmwYrTakM+tWNwmxE?=
 =?us-ascii?Q?B5yU7EhljjkPD1K7ypWTUFZ0bW/E7Vk3JXixABUHh9VHyn2SW2WcLdOAxdOL?=
 =?us-ascii?Q?7CTvqCx6L5ZxYMypb0O/MchoJrZpuTdNDnncytVTRLZLsEMcKEIjIKG78JD8?=
 =?us-ascii?Q?VP2n0K2/rDNvb5WB2nHyYDUlfrxvNW5uF58QrOGvI03i4UhJJ1s9E1QOdx7O?=
 =?us-ascii?Q?OaW9nn/RF3jQ2T99A1LkKsovQniFGZTPF1HgqBCIY2dTL4ts1VWIO+MkzjZ+?=
 =?us-ascii?Q?gThyoWjW+WmLEKO8BJwshXMqTncvB/SHCAK2Pm+zjP+qdghPGGQ7qzygf3S2?=
 =?us-ascii?Q?RA3w4Ckem6L32SVqVRBkNbilpuAQ1U1I8o5JOHbludyRjY4Pb/8Hn3gAan2N?=
 =?us-ascii?Q?+m1NjFXbxzaUUU+9TrZ5j0AzG/S7Ekq0Zq5vyDFL9pwPTf/9URc5gfjrYeSt?=
 =?us-ascii?Q?tHBmiK2PP014CgwIqc7nzRyrxiBUyn70ZWoxrcxuT7k7u47Mhyf/dZD0rF3E?=
 =?us-ascii?Q?C/76hvg8WZEfeOQvOgauGCEdgjA1toaaOIRHR9lMFVcYQPNH/HFxL30ZvK9v?=
 =?us-ascii?Q?w6NUfFeSwjUBFncsYt2Tz5ijTNsNBUz9qDh6buHGX339f3HuUra0mh2N7+e/?=
 =?us-ascii?Q?Dym1j8oHxsbGBRMCZIgLFphjNAwphVy2CcIS26Gx5wiV6HpWAAwdf7rlVOhn?=
 =?us-ascii?Q?P7gYBNCw4fhs7f0UssYo8vqXNGw0lRW+WbeFMtc6VIdJWf610fjsQ5jGWRFu?=
 =?us-ascii?Q?V/39Ptzo4AGzIhP/GwKAZRZqBkZCCozMKpqR1YTMzeJYJV4lpEOZUQJ0suY3?=
 =?us-ascii?Q?4zvgyrIpMl5gIdOTYGttbHahfREpaCalRHqw6wQ8ocm7MOtYPQasQTKkK54D?=
 =?us-ascii?Q?nVFdP1056YLoUp5h+2D6hMumxZXZAEaCRAjrG3NjBJ1UtcJIvITko1wcvmYJ?=
 =?us-ascii?Q?k9AIRdl38HanceSbUkG6EHu/CczLzGakVENsUy1y3Cx/m7CDOx3UqCtlEsVr?=
 =?us-ascii?Q?8aXquFzEuqwdVc8iPijqIFmM+unRXHewT2eUwEYc/M8b7K/mAQwTETYhbOov?=
 =?us-ascii?Q?MwXHMWkbzm8sYkAkTQnJ5C8QghYF3xKxylVlxSqZcjOS6Y857X16hkz/x3FW?=
 =?us-ascii?Q?EXYsL2z1YpC2l8Vvn80yW2MfMtLiT8xwxw4B3N47Oq7NlJnlR7sENZ2Wtqkn?=
 =?us-ascii?Q?pym6GJTPayAndbIBpQD+2O22eAKTghXik2e/zifCXFzhYAzRtBYGdbnaVq7P?=
 =?us-ascii?Q?fg2Q6YkyiKXgfGPHOTV3WtIXd5hADSHttab4DWJ4fbaxdwIM4k9MnF8g57W6?=
 =?us-ascii?Q?X/H/tAor7KjaQvKm4iukAFmjbeM8agWxLu91UYPBxefkeOT9A2i3Fo5A72en?=
 =?us-ascii?Q?ENWTuJwkeCROftBDc83+/KTDj4b+ASGLmahr5YZpQc2HAFXNfS2UkDSLPx8C?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7P71/z5x0GoTkTm3yV1Ow4mETXQTrgoG5aa+bA1YMheoxheJx6w39muUpTh/4UA7gehw8Mm3NSgKoQlz9sQB8FWJ418TLdG2FJuEgMky3UxSXcSaIdAShoVDUYbrj35EktwMcmZ6GgYsiVfE2kzlwRmZXIQEluo3yJZN62n9pJL2AaX5CKDjPKzBIh5BOD/lKByY/ctweYGde51ELtVBo7BvrL8Njnl00dFeIJy01NwqHsv9b9FNBrcbtszFzCj8tGJ1tGx3HipkNLXixyjmVql/WSJPkIiXCdX6DkPMOWm8gURTHsbJxKjDLfwf1C+HWvPD+1bCfHc603KsQE2kltj+5s5SM4Bjl2fM2pHi+pBjusdpEyn5qYjemn+7cPOoneU7kkz1cqjK5aj1+bevEAOhgcuF0/W23BUJPkt27WEO7Kz+vIMzcvrn1G9qsLHlPnEs+n2dBoDjA3AvsJRSvqLFEEmsW4fVpsa/uPKi/K3qcsudzilDdxxuAQyg3K86/w7KFgkxglBNVgUzBWgMOWnowRNUBMzl2wTkPhe5VRhNw4UgkwL3/93d9TT1VnM6pHRFZ5/45NzVkFt48t2fQakdoe8n2gJYNympj0hAB34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53e5255-8823-48b4-090b-08dd138eb91b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:27.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a39yLPdpba07zGHTX3idSHR0dOBeD5D85SiKi6bWCAmboYuKb7fBNI96Yrx9m1LpEYtjC8Qp0m9ouAkyq0T0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030100
X-Proofpoint-GUID: abz-twr1Aaf1GIuxGW3M0kZisEBhssJK
X-Proofpoint-ORIG-GUID: abz-twr1Aaf1GIuxGW3M0kZisEBhssJK

Way back in 2013, in commit f5f05eb28058f2a62efeefef7c5faeca62b09578, we
added a special case to Ptrace() causing it to not fail with an error
if ptrace() failed and Ptrace() was being called by Pgrab().

The need for this is long past: noninvasive tracing provides the semantics
this change was meant to provide, far less unpleasantly.  Worse yet, the
patch is not threadsafe (even though we can have arbitrarily many threads
monitoring arbitrarily many processes), and worse yet, the noninvasive
tracing support in Pgrab() wants to *detect* failure to ptrace() so we
can switch to tracing noninvasively instead.  If the failure is hidden,
we assume ptrace() has worked, and our first attempt to use this and
waitpid() on the traced child fails with an -ECHILD and causes us to
assume the process dead.  Since it's not dead, bad things happen:

libproc DEBUG 1733155118: 386060: Ppush_state(): ptrace_count 1, state 1
libproc DEBUG 1733155118: 386060: Ppop_state(): ptrace_count 2, state 1
libproc DEBUG 1733155118: Pgrab: grabbed PID 386060.
[...]
libproc DEBUG 1733155118: 386060: Activated rtld_db agent.
libproc DEBUG 1733155118: 386060: link map iteration failed: process is dead.
libdtrace DEBUG 1733155118: Called dt_attach() with attach_time 0
libdtrace DEBUG 1733155118: pid 386060: dropping breakpoint on AT_ENTRY
libproc DEBUG 1733155118: 386060: Ppush_state(): ptrace_count 1, state 4
libproc DEBUG 1733155118: 386060: Ppop_state(): ptrace_count 2, state 4
libproc DEBUG 1733155118: 386060: Cannot add breakpoint on ffffffffffffffff: Operation not permitted
libdtrace DEBUG 1733155118: Cannot drop breakpoint in child process: acting as if evaltime=exec were in force.

(Note that we weren't even logging the fact that Pgrab() had failed, up ther
before the [...], and the first visible failure happened some time later,
with entirely inaccurate messages about processes being dead and the like.)

The solution is simple: take out the whole horrible Pgrab() special case,
and treat invocations of Ptrace() from Pgrab() just like any other
invocation from anywhere else.  Pgrab() already deals with failure-to-grab
errors perfectly well, if we only let it see the errors at all.

With this in place, test/unittest/usdt/tst.multitrace.sh survives 200+
invocations with zero failures.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libproc/Pcontrol.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index 6a454ef86bc3b..7d9b5055f8201 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -39,8 +39,6 @@
 
 char	procfs_path[PATH_MAX] = "/proc";
 
-static	int Pgrabbing = 0; 	/* A Pgrab() is underway. */
-
 static int systemd_system = -1; /* 1 if this is a system running systemd. */
 
 static void Pfree_internal(struct ps_prochandle *P);
@@ -327,9 +325,7 @@ Pgrab(pid_t pid, int noninvasiveness, int already_ptraced, void *wrap_arg,
 			/*
 			 * Pmemfd() grabbed, try to ptrace().
 			 */
-			Pgrabbing = 1;
 			*perr = Ptrace(P, 1);
-			Pgrabbing = 0;
 
 			if (*perr < 0) {
 				if (noninvasiveness < 1) {
@@ -1373,10 +1369,7 @@ Ptrace(struct ps_prochandle *P, int stopped)
 
 	if (wrapped_ptrace(P, PTRACE_SEIZE, P->pid, 0, LIBPROC_PTRACE_OPTIONS |
 		    PTRACE_O_TRACECLONE) < 0) {
-		if (!Pgrabbing)
-			goto err;
-		else
-			goto err2;
+		goto err;
 	}
 
 	P->ptraced = TRUE;
@@ -1386,10 +1379,7 @@ Ptrace(struct ps_prochandle *P, int stopped)
 
 		if (wrapped_ptrace(P, PTRACE_INTERRUPT, P->pid, 0, 0) < 0) {
 			wrapped_ptrace(P, PTRACE_DETACH, P->pid, 0, 0);
-			if (!Pgrabbing)
-				goto err;
-			else
-				goto err2;
+			goto err;
 		}
 
 		/*
@@ -1406,14 +1396,13 @@ Ptrace(struct ps_prochandle *P, int stopped)
 		if ((P->state != PS_TRACESTOP) &&
 		    (P->state != PS_STOP)) {
 			err = -ECHILD;
-			goto err2;
+			goto err;
 		}
 	}
 
 	return err;
 err:
 	err = -errno;
-err2:
 	/*
 	 * Note a subtlety here: the Ptrace_count may have been reduced, and the state
 	 * popped to match, by an exec() or other operation within the Pwait().
-- 
2.47.1.279.g84c5f4e78e

