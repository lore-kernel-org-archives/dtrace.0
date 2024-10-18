Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034520E312
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729276707; cv=fail; b=RHPyA1aaW/Z+OuEz509Mam4QticBTE4b5Vfxoe/aQXW5gMkoZjhnIYFy2g0WCfFCYFfsEyufCgMn5PmXt1OLuCUTwc8QcPAForwRIg0Ouhfpy5lv3sS9GIOxPpCFFIxPCrFqD8XIDgnRXXTyHW8fmHbQocCGX31CWvY78WheNN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729276707; c=relaxed/simple;
	bh=xHwHyXEXJmXLSzElCB4Vs/BwuVzqkzeLSRWflf3/UJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EWV0qSNI/z+Ryyr2ACkgW2HgCBQ5uKkv9/uSCx/Gcf/cmLuUMZP7rjXVTP0K2kR4kvynlI5MJlXjQlf7iKAhF/+WWKCMoNa0cMy/y/nB7zh+Vrtl598TMoZohQUvj1yzU0/4Tx6xLYHOjKH5AEX8NLkOlIwO1yEO9RJwB+nCjfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Aqruqxz+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nI5ZsyeO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Aqruqxz+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nI5ZsyeO"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEBhPq022582
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 18:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+nxXoOYnRfSscJSCZi
	O9+ZhvH6oRrH8nnTpv+A+ldQQ=; b=Aqruqxz+S+OtWiZjO92m8fnHJX+/Dr9qYb
	7oQcBx1zITVSxIJ9SnBRR2emOJepoA/HUg59I0yPVqRTnRyc81I2Ap34hRlZSOAK
	gB3Cx6qL4bhFFO6C8ULUQHmyCz1RYFu8aQ5FbfJEC2c+pMPuS1HkRs14UJR9l4XL
	8uUmeW+OfElZ6djOQZcabga9hTJbQzq+FFbIpTwTPOIzZomsH0Js+/wFbFcdUkZo
	IaII3ibB1Fyt4A7kPmlfHWDYWhASIHCBnqSqmFznUKteVysaLK2U936BWUNfiQYk
	J4Qd6HZ4uarERQpctYKuxEWe//mnbyMs4W3Z8GcIci6c2HIikS9A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fw2sn3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 18:38:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IHgiJP035999
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 18:38:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjgkpu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 18:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN4VFr40CvQAvqunL8ajX1nvcBTqPJsazA/rfxl7/aWSh4ZKUDw3KXK3+dGpfVjzhIt8ySRVbkPG68ZjBClJ8SDzY/+WAajd5XY5hv3kVDe97yOvD5kfXR01+N7zWXK4PJySKytuVy/+L/7hVsH+EHPNQpIvcPV+z6sH1kmbqKZtejzP0sjj3qKDWQRnmb9DkJB060lrHUuGIH6t875me8lutJbpaaKh5MgLfkIXvk/cGI3+v3+W6G0SX47BEnFLIZDivopIeQq90ZYvKzEFzqo9JGC6McugJFsndN08Ez9BUb6DoAqvtyBrIz89dFQ8jnBK3Ev602hEBuCee+iJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nxXoOYnRfSscJSCZiO9+ZhvH6oRrH8nnTpv+A+ldQQ=;
 b=J11vNgnA8phyp6oBRGcHI4+81kLdyLIzTVTLwXI0R5oH2inZSTvniTfH2F+c+LT3tofV7W8AuOmH5SDUqIcYaVPEmH9PEWGX4vN5XdgEzaOh6lCTZyhZtNfgTPe/YfHN1auHtlqVSgmyLlqLAdrtgkuyM7gA5Ya0es2LOAmwzr3F7oyKHJYAjmw3KfXWxAYR1jq0QhLMzTnzu+ttZiOm0dD6vmzdsTupUqFzc4RWdvKl+V8mZ0B/J/sWVaPkD5/d+5dBrHxdWbCq92J4ACFftOR+9M2PzqyXcZxkftRibs/ssw00OghuqJ9istyQX0W5GaROiM3lqUQVrH/cSGqa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nxXoOYnRfSscJSCZiO9+ZhvH6oRrH8nnTpv+A+ldQQ=;
 b=nI5ZsyeOe1O4orSDypl4cYMDADolkfKZkCXbdxrh11nPJMoZwOZuMXi7AjdAPcgypk6Tz+uS0I0tF1Qz3zZrSrgXIO29OVIfu/3QqvB9V0bhiTEu+8vq4L41yP0uEe1DSh88En4jRCV89plV629erVOLGd78ZwYUyAbxbKHuVe4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB7099.namprd10.prod.outlook.com (2603:10b6:510:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 18:38:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 18:38:20 +0000
Date: Fri, 18 Oct 2024 14:38:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 dtrace 0/4] kprobe support for .isra.0, sched fix
Message-ID: <ZxKrGURKZm+ARD8F@oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <ZxKBrsZZH0hV6cdD@kvh-deb-bpf.us.oracle.com>
 <d8aeeabb-fc53-44a6-9f8c-c5b3a1d8ae40@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8aeeabb-fc53-44a6-9f8c-c5b3a1d8ae40@oracle.com>
X-ClientProxiedBy: BN9PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:408:f9::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: f76abc8b-4997-49be-0c0b-08dcefa409eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sxo97tMAbfnBUt7OjOdiYtaW3Si04lnOfKFB+46Ov2EGFzZ8EFHM4ZqYh1Cq?=
 =?us-ascii?Q?nuX/dbEDLxLQjio+KPqVHre9+ERMl6GUyuzh7bODzounT5ID/0yHLWOxOOek?=
 =?us-ascii?Q?FuvAYcfrElj6wbYAddmfcFMRmc+uTd/Qi+m+xYPfQXdtQH5Qpwns6gedTvmI?=
 =?us-ascii?Q?7LUOExQFbrh0eGEPW2ei5YYr5PPi2K3fUREYnTo+25yuSjA+bbSo0yX/f4I8?=
 =?us-ascii?Q?g6quX11zPqhhdjtnqrmzkwb/SVypeobqnKqNhgUPoJ/BVkH6d4f6qanigoqF?=
 =?us-ascii?Q?ui/S/WHTzQV9ejbLIl7GsX6pnyKxRBgywZAfsKyQuGttW4EgyOwXMAGfHoLf?=
 =?us-ascii?Q?3Z2AcldF6iIrOYs2FUNksBFSDTovHcmfiWBKNL+2DWTRvy+IsyuMcOzL1jBI?=
 =?us-ascii?Q?g4BgZQTU7wvkv5EzYeG0TfbkvRySqZt+oSz4uWAdLROvKaYo8yCdYk1LDECI?=
 =?us-ascii?Q?CKOSC/lwyVT49MViUNMuxAK+VUdKr8/HsncRXMneoD27JyI+DkvlYB5Vv4jP?=
 =?us-ascii?Q?3MVx90+JG4JOwglg/12lbserTPu8HOgdgKdjQTlinqJ00W1c1njK8tgicTVX?=
 =?us-ascii?Q?dbOCxmgTBBydszfuadzCJ8GFfus3k/+TnY1rseoQ+0w/r36xVKRqxCCfNf8T?=
 =?us-ascii?Q?Pc4GYzi7R0HDu8hkxza9ubpnm0HVAVkZjQdFMbFPWWLMUsgUD19opuGMYlg5?=
 =?us-ascii?Q?oMXYgnJxOmTncg1h19pUkj3xSRtLAHF/XrOAo14Z7A9GldfrLSR8bF4bY+jB?=
 =?us-ascii?Q?E3hs16Egh4FCaVBAhcc0DsINLVjPzOpuOMxfvq5n4BV13ApvnzaBUQckSkOQ?=
 =?us-ascii?Q?1SWCc5IOgZayF0lJ593t2P4JNLF684ZCBPu5pRzDUW5GpwKGj3lKr14S6HpN?=
 =?us-ascii?Q?otp+gAPN7L4qJaNPQ7gtHG/RLtgX6iB2rLkKvIWXdEqjQD+g7tBHKLavN8Te?=
 =?us-ascii?Q?LEee0FsLVdpbPPmOqOQHCjB+mbdUMj4FV9W0eV1Y28i7TJK+Ni+8ifelQtb0?=
 =?us-ascii?Q?6l3DnJMyy/9JxrXCgw62w7kNZaQb0fQ/IGHi/zr4pM+P6cBMiut8PsbfZAxE?=
 =?us-ascii?Q?wTuetFUwXV2eOyBWau8BvATCfwRzdOLVOBMY7GAh7S+UuMSOtwasEHFIC3pZ?=
 =?us-ascii?Q?XCNYCgu6q2c/3vMjt+C7orQWZpBrDM69LaIcLmazPBIHDVwKVnC6mSpCTyaH?=
 =?us-ascii?Q?15cmupm1b/qDvJH1OwQqWVo2QDQSgsKr6j12+zuntGf7jswY1uFvskEDYwrX?=
 =?us-ascii?Q?0gkPd/HF5rwKYzBmLGsvf1i+ANE6PbWhJFSkCX0D3Yfz4Qim64cLmI2DAyBf?=
 =?us-ascii?Q?QFMUsUY22insYRwahUpSYjii?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PiC8hn5rcvOrQHfOcfiHVXGPNmaB8pgkf0B2Y8DGEWb5p0vLuB5ZRyWT0xmV?=
 =?us-ascii?Q?boZwAq3QQr8RvQn7LukyxBfUhD4qREXcuCSxL182SrMVhVq6lMFhz48unGvG?=
 =?us-ascii?Q?jVQI44rZP+b0ZEVyxZG1Efm6EKU77DH3rE/ewsGK2uM1QzxlNHuplHOPOZls?=
 =?us-ascii?Q?PYgt66pZror0iVeO+ecW92jzdmH5kbebj1dd1s/sHjJi4SKrhOqRW7ZPE9fA?=
 =?us-ascii?Q?NVhkvG7AXN1pswu+JmmVmXQxUMlPfo5cYCxKWIRYCEXovKfkXE7Vvnf8EU69?=
 =?us-ascii?Q?J/I7DbYOUJx8jA9nZB8WH8JqCjJeJ31GctXX2IOOvks/xmCGFZXbU30CkJoE?=
 =?us-ascii?Q?jQe/izq1xkBhZapJZbQJGigOHiAIIa70+n3OL92kwnwNUyZO8oDmWl73Gb8/?=
 =?us-ascii?Q?pz0FxUABJ4y5THPQ6LloRB/68yBrELRAkf+uDoQjCo/25jxviqADSvwDPX22?=
 =?us-ascii?Q?gMetYxktv+k+7O0pJci29Jq4x6tRxfvmY0qsUKLExoH/MdlpYfipmhRroUXR?=
 =?us-ascii?Q?LhuqpjYOpUh8JQmhFn5YeLA/spOIErU96gsLPRxjMAKlEZjM2wpWOg6Ayvl3?=
 =?us-ascii?Q?XUqvmUUlNOcHL6T0lXIq0eJWJ0psztkOuAu1SXp0wZlpkSsupjmI+fQQlUfS?=
 =?us-ascii?Q?wh/Pjw5m+tEQJJje3X8hUsMsmNElitzl4h2/nV8hsLT3m0XOw/n2k47CLdAd?=
 =?us-ascii?Q?0SVC78k1lwgWExIY+nNA7Mk3JpHL8IT7BJbtR1y9V9pLaBYUKNUwRHYg8S+P?=
 =?us-ascii?Q?NPWZ6I1HgVw8vZOZPOfyEQZbwG2gfJEJdOLjlaIAFSOfX0kaAsAeuF+z6sc3?=
 =?us-ascii?Q?hi9WL63xMxgImFBk0KBCfpTHa+mqtFaHG7mpIMkbcDZOvm+N6teQYYEjZJY6?=
 =?us-ascii?Q?yqcdiYYcldyEYy7u+owkKjduV8iCHVMfPu7z/xiCJjHAKPEHEj6CFTtElwjp?=
 =?us-ascii?Q?ERBeyaIcpKfZP3jGTfzjgcECDwmED5yekaRE1LiU7+xibqpTW6CTySbU881d?=
 =?us-ascii?Q?Db0Z1g/fKkloTT3bgMeaCq05N4SoB9zC4EpGpciqfRug+elXsnd8uLwm35Hh?=
 =?us-ascii?Q?AAxmRqDKTBOO3wAEgLRH2Sj6aUXXzHjzgWYojm3i6wgUzQb9cFtOfcmSV/aX?=
 =?us-ascii?Q?tIjm1wjvgieqkxVXvqSK6X+tSAjAx4ivzsRKHgBe3bBnchiFIkc2jeAjEaxB?=
 =?us-ascii?Q?b4wrjMQJ3u/w7jn0/LsDZpY//8HLEduwzaZtq0RkwfR/IBlhQpn37KB2hHwZ?=
 =?us-ascii?Q?e0n3LBWUjDe6A3QJHppqRUn1itqwuGGoQI3HqJM053P9rX2xTDHpIhEIDBFp?=
 =?us-ascii?Q?bQOYfnTQdgxoT9PKAeMlueZA2Xos5H+pUCRaMYUYf5RuPw0Ec95loQPTcm/G?=
 =?us-ascii?Q?/p9Z5kt3spqm5W0pAoACQOg0tOnu4N/mo4SJn15UfsbwPIHW3qUPnajPbuDj?=
 =?us-ascii?Q?FzqZt8fRdbAYNkJaCPzpxYZrBog9RlEFoh0zroqxrc1I2TIGyDKr+Kkdin9/?=
 =?us-ascii?Q?xRCOVmgF3F/i8mHuUH3azzINUNytZ+sdJiKk2vE6ff0GjBdmNdypTks5EkG4?=
 =?us-ascii?Q?vLwoCEsKj3y9EVVOTxQFQCrEiKzGjinjigBrGm05borND6i8UP248tncvOaq?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZXyoJosVTuCAEQ3evuLwMp1KPzy+4U9yr6sl5zPnIAHC0H7dTpPluC6fe79QaPgSSY9jJBouY+cuGRZtDi5ZBBxmPNm1hLEbF0cFfVsBRqonevTZ9YdH2MVK6foIjbzB3m2WvcDta4j6dcvRMSKXXpP7CoNfCpfP3mhFDvN3PuZLY74FENowFzyF6nTth0dxVIsiH4t3xafpj1sXofSI/0a39mT0YGb6bKXIismGGSnuRBlztbZBeshWAj5XepQUlSCKt3tYq6ERV7YlrHctOAtZpggzhILJ9LKaSXcopU4nZOvUhjhH2hGZD0QWZPOBjncD8DeWWdjm9N9mTmestvZKcnqVHnKIBS9HmTsfsDSe5O8gU4qaJ6dc+Hj25he5eyIbcw72xBdvJ9N2sfEtrNbsnEU7/rEWjmUXAuzKwrS2+Rz1lzd5vrTrQm16u3JZenddUTn1d0oOjL0tSVPwyIAcvqdcoDBvjc+x5/9BeHUM6YG9lfRZvClMkrKEMvtWShJov9/Me6F12yCV/QyCgfCDoRxt/+g3wSIk3FVxEqt2Iwp6LoUVkxAp+xXQLF9XD/8FBqQRlD8SolD/I8khNe7lU9rzBLgnlHCJipEekGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76abc8b-4997-49be-0c0b-08dcefa409eb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 18:38:20.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTktX/QftxcQk9Lsd8SAVsjlZ/6g17ZR6Jl2eDUBhnkxXcWlLQyXtgIZuiw+sULHBYmrkWL3fjSapcFNClt4Ap35YV3GTuqcqiOrz8FgcbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_14,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180118
X-Proofpoint-GUID: Zdy2d6px_A1Fns5cFH6kqIcmi64giuQB
X-Proofpoint-ORIG-GUID: Zdy2d6px_A1Fns5cFH6kqIcmi64giuQB

On Fri, Oct 18, 2024 at 05:15:59PM +0100, Alan Maguire wrote:
> On 18/10/2024 16:41, Kris Van Hees wrote:
> > Before I review further, I have a question...  Do we need to consider the
> > <func>.<suffix> symbols as separate probes from <func> (at a user level),
> > or can we group them together?  I am hoping that grouping them together
> > would be the preference if only because the suffix versions result from
> > compiler optimizations and it is therefore likely that a user would want to
> > be able to probe <func> and expect it to work even if the compiler decided
> > to do something under the covers that results in a suffix-variant to also
> > be created.
> >
> 
> Right, that's one of the changes in this patch series versus v2. We
> expose the probe as <func>, even if it the underlying function has
> become <func>.<suffix>. This provides more stability to the user and we
> are guaranteed it still represents a function boundary because of its
> presence in available_filter_functions (this implies it has an
> associated mcount-tagged fentry site).

Good - then I am on the right track.  Continuing review - focusing mostly on
whether we currently properly handle multiple FBT probes with the same fully
qualified probe name.

> > On Wed, Oct 16, 2024 at 04:54:05PM +0100, Alan Maguire wrote:
> >> This series is focused on solving a few issues with fprobe-based
> >> attachment which prevent us being able to attach to functions
> >> like finish_task_switch.isra.0.  Such functions are present in
> >> available_filter_functions, and represent real function boundaries
> >> (since they correspond to the mcount function boundary sites)
> >> but because they either lack BTF representations, or because
> >> those BTF representations are named without the .isra suffix, attach
> >> via fentry/fexit is currently impossible.  Falling back to the
> >> kprobe implementation is the best solution here.
> >>
> >> However, for stability, it is best to represent the probes for
> >> these functions without the ".isra" suffix, so we need to store
> >> the full function name (with suffix) in the tracepoint data when
> >> the probe is populated.  Patch 1 supports this.
> >>
> >> Patch 2 ensures that we use kprobe implementation for any "."-suffixed
> >> functions.  An additional fbt provider with kprobe implementation is
> >> created to support this (so as not to  disturb existing fprobes for other
> >> functions).  At kprobe attach we use the full function name stored
> >> as tp event data to carry out attach.
> >>
> >> Next we need to ensure we do not end up with a mix of kprobes and
> >> fprobes.  Ideally we would do this in a more fine-grained manner, but
> >> for now just ensure we do not have an fprobe/kprobe mix program-wide.
> >> When fprobes are active, we will only use kprobes for "."-suffixed
> >> functions that are used, so in practice such mixes will be relatively
> >> rare.
> >>
> >> As Kris pointed out [1] at compilation time, trampolines have not yet been
> >> set up, so we can replace the provider underlying fbt at that time.
> >> The probe_info() callbacks are used to check for a mix of kprobe and
> >> fprobe implementations; we check for multiple fbt providers which
> >> have a count of used probes > 0; if this occurs, switch the fbt provider
> >> using fprobe to use the kprobe implementation and reset any event
> >> ids associated with fprobes from the BTF id used in fprobes to 0.
> >>
> >> Finally we can then use fbt::finish_task_switch:return as the
> >> dependent probe for sched:::on-cpu, as we now can probe it even
> >> if it becomes finish_task_switch.isra.0.
> >>
> >> So to recap:
> >>
> >> Patch 1 supports storing/freeing event data with tp events.
> >> Patch 2 allows tracing of "."-suffixed functions like
> >> finish_task_switch.isra.0 via a kprobe-backed fbt implementation.
> >> Patch 3 ensures we do not end up with a kprobe/fprobe mix.
> >> Patch 4 then uses the fact we can now trace "."-suffixed functions
> >> (with kprobe fallback) by using fbt:vmlinux:finish_task_switch:return
> >> as the kprobe dependent event for sched:::on-cpu  . This function is
> >> often optimized to become finish_task_switch.isra.0.
> >>
> >> Tested on upstream, 5.15 and 5.4 kernels.
> >>
> >> Changes since v2:
> >>
> >> - probe function name exposed drops the suffix (Kris, patches 1, 2)
> >> - restrict kprobe use to "."-suffixed functions; this makes their use
> >>   less likely in the fprobe environment.  Do this instead of creating
> >>   a "fake" fprobe probe with kprobe backing (Kris, patch 2)
> >> - modify fallback logic to handle kprobe/fprobe mix (patch 3)
> >> - modify sched:::on-cpu to use fbt::finish_task_switch:return ; no
> >>   wildcard needed now that probe function name is unsuffixed.
> >>
> >> Changes since v1:
> >>
> >> - simplified approach by just swapping out probe impl when BTF lookup fails
> >>   (Kris, patch 2)
> >>
> >> [1] https://lore.kernel.org/dtrace/20241009140236.883884-1-alan.maguire@oracle.com/
> >>
> >> Alan Maguire (4):
> >>   dt_provider_tp: add optional event data, freed on tp free
> >>   fbt: support "."-suffixed functions for kprobes
> >>   fbt: avoid mix of kprobe, fprobe implementations for used probes
> >>   sched: fix on-cpu firing for kernels < 5.16
> >>
> >>  libdtrace/dt_prov_fbt.c    | 138 ++++++++++++++++++++++++++++++++-----
> >>  libdtrace/dt_prov_sched.c  |  23 +------
> >>  libdtrace/dt_provider_tp.c |  27 ++++++++
> >>  libdtrace/dt_provider_tp.h |   8 +++
> >>  4 files changed, 158 insertions(+), 38 deletions(-)
> >>
> >> -- 
> >> 2.43.5
> >>
