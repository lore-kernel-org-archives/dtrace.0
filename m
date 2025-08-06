Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250FD28C87E
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489447; cv=fail; b=ret/gvchGhyIvo2if45PaatM7KZ2hI68vbCF7BzS9wqG09opCimpzb8BzQSXpHvdZ8gNjklQTXa5mig5mY3OXeTPchuBNPynrxOgnJKMNNyCQ9PrzFsIWAd9AroMu/yivTTchaOvxptmJ8dsEm6+wZgdDTHyExmXJC2kaAx0ikc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489447; c=relaxed/simple;
	bh=ahSEctHoomziZGY1iKFzaW3NlxNhRfAndnR3wjnGU+A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kfpa7jcnWBSXl3V5nD5ztJgPgBE4i+9rdTh70Iv5V6NQvjt3rdRZZs2NlxTuwfIstNWLy+zeDaRmmrjGE503P+uQywlGM7ensnN5xt0Jn+FHfwU06/8TFCR8vo7vL7n1aWxLV0OI4UdR1SCHjHcZzt683M8L/Ct/tQa+gJz0NCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bYQ5cO1I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gLjNget7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bYQ5cO1I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gLjNget7"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRUYA006169
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=N3Ll62DdWsBTou9d
	qBVFlnL6WfcDzewLcm+vVam8Ki4=; b=bYQ5cO1IxV38xJpxWyECqyQoBZAjfvbW
	foewpmFeNNJFe+xwsOL269xbtEa7s4FJ8b+Anki+OQKd1PLpwJIpfiJ84xOmYzwE
	zNVtmD+qARjDeOyBviAjCEIdLgIknmR5wfjp3bNAnIQkg6ijO9cv1OSZwBBk6NFN
	e2rnoj3TkED76pDu7HkGssOMCieUju/jK3FwnLwPx/Lxht5fcxSdl186AITpCOYO
	Ttamex51i97tTvK/72mbC5Jd/5uI1p4uSYuL+7o6v3v+vcjfPB8tGSMtW61V+5tf
	lun35cHe05E3WTgkhNub8v9sMdcewdOVMjYtD7i3ezZezomyvxqA/Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvg1t1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 14:10:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576DTUAq027117
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 14:10:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwn2wxd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 14:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbjgwqE5GROByXBgszYkAhMKgYPoYrFAa7Md6qJfA74oLz//pEoN0vzIRLEuSscd9jH2IdNVRGb+Kd3Cml18RTXvoPEBPyJJvCphJ9jT7A9RKQQwLYj/zOz+htQeVi8TVot4m8WEQ//4kAOLNq8DFIjzqDq0S7L9I3rRQiXYPw/Fv6rOdMI1KF6s8A3tThWoOEmtLZMAzECPY1HPIy6cSsZu6EP5wPUm9zu97l7xURWhcXIeW+ubxyZz3iayWJX8FmfyCSrsAbx0XkH+ul+R3vmFzDyV8qFhEkNvhDkEb6wsI0QHLIJMcdaIFikBp+XRsKWo80NyQHUCz/Kq89z9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3Ll62DdWsBTou9dqBVFlnL6WfcDzewLcm+vVam8Ki4=;
 b=Y9y6QAgGANH4KQ38HUmMb0v//OLing/fnorn2a5837wD8Zh1JH6TPvBtaouk1WYwALhjwcywto99EqGx6v2ANfX6TDTB3A6ui6iRGB+UvBedcpYyd2dqaWlV9KvDHSw3gbKbJTvYFTOhIjiGIoGgXi+gRFE2gFz/1y+/kx+6luSfavtMS26xtmdA+5ksI/K7NXd2mJ/68e7STES8ekIil70Ld55ce6w1VyFUIKy3FElzuCrCdhXRNQnqrEZOsRD7/n4+rSQPsrEYbU2Pyg1i3jSOvD0Eg1srJMwQ+WHxC0hjgtfHvo6EBmOQqHP7iKiqL4fpUESMJfc4CezKyUMGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3Ll62DdWsBTou9dqBVFlnL6WfcDzewLcm+vVam8Ki4=;
 b=gLjNget718wXhtrAuuIOGZLq1Img8DfWyLZxZG1zNXJlT5e7mfMO14Jz3Ud/V6uLE/g4e1GirfDwn+FoMLmJppND7/uqP44zQYohSNSHKDVfflFhPFl9wb5PLO8XbK4xgk9sAksf5nwbydrwr+uI2k6R/WHaQNJedokhXm0ayxI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CH0PR10MB5100.namprd10.prod.outlook.com
 (2603:10b6:610:df::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 14:10:41 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:10:41 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: drop special-casing for naming of OL10 BPF crosses
Date: Wed,  6 Aug 2025 15:10:36 +0100
Message-ID: <20250806141036.2263-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CH0PR10MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c5834e-5894-45e6-05c6-08ddd4f306d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qhwmYoupPtQlB/xUvoQ7uNWEq3Oz/WdFslWOj5xrjWTfT7dMMNzPQLBNcQGS?=
 =?us-ascii?Q?TzmxOEMLQ6Xe3YzZTYSfKUdw3hsuAT3FYfB48zOym3cS1/vwy01QpMvuRyiZ?=
 =?us-ascii?Q?ZtpozSWpmjc9brAun4b1g0oRdUDYaTH1B4m88naGGVxgsGtBW1i19PWrr8Nk?=
 =?us-ascii?Q?MTrLO2agLougNpwK1ZtY+88p1M1hgBq7zdLM8KeFvauivavfOk6ilM+WOGKz?=
 =?us-ascii?Q?aGs+xrm7yTotudv8IZOn3z0vmGLXJAGBu777iOANlmiQPOMyjYqEWYksN4zt?=
 =?us-ascii?Q?JtFSImzNXMc3MmrxfdVHjPM8SDw9HMRme/YPLKJr7uNNM2Q9xfVB8pxiX16g?=
 =?us-ascii?Q?HCI65kcJ4Oaa7X3t9Y+xG6i8Dn3BOwsh2l7EW8/2xiuf2rjIGRGwg3pRZqpI?=
 =?us-ascii?Q?DvLBG8nRCXSLEr+elXBHSiMH94GV+/Jv2Jg1V2NOYQyJzjSLYSFGL7TTGEbA?=
 =?us-ascii?Q?F5OjUA//Tnu8zcSofW3Q3n2Xyx8A0AVgPdClwxUFIgsTxe00OVChI4SXnh+v?=
 =?us-ascii?Q?2FITrTjgcZ3wyLV0fKrMRWq3FZokHe/sBVLF/jsfMl60ul9wthKCaNVYqXpS?=
 =?us-ascii?Q?2nRb+1tTCXAC5xBFJENXTy/fcGKpm7WQZqtlgqhUDpovEQysFbCpRlpAH7Wh?=
 =?us-ascii?Q?0lr9YMMC46/ca4CAtEVJDrdeExCSipgLNXX8YfwV14GAMeIj7JFfCwZRp8R0?=
 =?us-ascii?Q?AmDLzS6b9yd+iUbqliCibr8Xg1SD8F3BQUrOvAfHr+bHtHeIaiGbtWCyFTik?=
 =?us-ascii?Q?BZtTsv50rGj3lzO3oAImfzFnc7CPBjRo/Xu0GE/kI5gavenV7qws+ZIFATZp?=
 =?us-ascii?Q?4CwFQdSuqDkkGsfxVSdDTXA0f6WNzjvYE6tjffzXXhng/PKCxfGQgLs3bEax?=
 =?us-ascii?Q?iB2PvbEllVDWoM6Zuw0fUTT6hy/4BdyX/u+gTN51ZpxHrssZxztVXllk1AhS?=
 =?us-ascii?Q?wWRM85u9nLR10d9bZLHUZJXMURs1Us3tnV0+PfGn580MtDgPPU/+OagZ4LHI?=
 =?us-ascii?Q?OiAVihfbMSTu9lI5gEs0LPWF6VtZDAlyfLaIJe9MMbXbe85ifzTyzjKbksWx?=
 =?us-ascii?Q?5IoT4MY8tCZYgXrYAdAnNMEqk7qBHzHiXXzIUCDvHmzbFbiF3M4nu98phYF3?=
 =?us-ascii?Q?U16lZ1p68q4cNsQsHmIsms5Z4B3dTO31fmaNw1B5qAfXlHfP81QwMYU6OgpC?=
 =?us-ascii?Q?usNiTInIpHbzszvpJsMpO/yph3wgUOTtE9VW499OKHZZlXr0kKrzy4qJbS2T?=
 =?us-ascii?Q?/ghOt/ND0klWvqLJMh6M8GQQ23w7aWxFYJDo1rYY2dyLgyvriRqVj3iPWmeg?=
 =?us-ascii?Q?NiM/ow5klq9qTP4cPERccZqx69Xz8gB7KfW3cfr/YwYvOgIbiZYBpLelov90?=
 =?us-ascii?Q?WzCNoFCe596Yj7Eb7jgzPBgb+zrFK4ykxSFYa4KQLdPE93J9YvMKbiIaayNv?=
 =?us-ascii?Q?jNW/IHSr9lQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Q7By0JCCaQX1cJ5aa+D+Mri33cSj8bNvr4mY2RhQsI6/zg6WK1nkA3a+Szq?=
 =?us-ascii?Q?xl4MH6Zbjoy6UsRI6fizW+9cTbiB2evCBDvODiLTURPX/fWPqPC8vhncQ59k?=
 =?us-ascii?Q?PZZvBNpSsjQJm2tvskQH+2WzsJn+vop0tOGttzuEy2pgEnDyYlFAaHSPkLsi?=
 =?us-ascii?Q?MDv0UN3JQyJlZDxI2qCmXrw+sAaAmXcpggMY7aInPMkq+sboQ2WFGCjwfe88?=
 =?us-ascii?Q?xXdyqDi+mk51OQkstfgvQg0h178dMWWzNuai+1Ge15pW3+LJVkQFMTN0wgv0?=
 =?us-ascii?Q?vdDCH04eA2LKgtlXU+e7rPSqtwaAQuZeQ130bZ1SQ8bD+MFwkzdIWyAk3U71?=
 =?us-ascii?Q?QMFjx5NBl1ThFc/0jgR3in5nMjQ1NlPfz6J2kmHy6SUebqjEqnHDU5861dlZ?=
 =?us-ascii?Q?t1XmRaX5maxHna5AzR9uw4R2DMH5JmrCg8twY/ZX2Siq5zZSPXbKYAVZA7hY?=
 =?us-ascii?Q?kfQqgduOgSGLIsrdcv4tuGFlEjPIDKJUvvBkOmJdyvQpG7RGn81tyhRbrzJs?=
 =?us-ascii?Q?7Q8QDKIIOHq7l05e4ajCRdRqOrytOAi8KXvhDJ8HUKYReBqTRala+3p6nqMs?=
 =?us-ascii?Q?kvZfzyzIIBU0jU8gYyFYe9YyO8jFSm+3ffzJF2vWFA26SusSeIYLx7UAGbED?=
 =?us-ascii?Q?CTqk1aPrt5cJ8Ome4WMTniIv5UgmDr2eKwSuiPK6lWSP8obUXjRVfp03V8sL?=
 =?us-ascii?Q?0MTVcqnLHHAUgB+X5Oe8UUlt3wG5xwrOGUByqHtgf1J+Ojvip9O+KDTIKmrW?=
 =?us-ascii?Q?MoXnh7YqzJZdjcyjEmqYVKx0OiRcSnpr8+AfUmLIKdD1QjS5/jO1AHBAYETa?=
 =?us-ascii?Q?M/L2pp8kf+tMGj6NH5fy9TRERX2g0GRcH/Oy4MMjz67goA20cpzKdlzDoe0f?=
 =?us-ascii?Q?+gQVELcd8QETbJVL9rhu3Zrwq8BPQKYZz+7hJ7xr0X3Bh3L//KWu2ceVzeFb?=
 =?us-ascii?Q?25eNWY+Zi+bzrXaOOGkzkrzveyfv2ztvnefwBOebWRmM8FUErKhSepADr0G0?=
 =?us-ascii?Q?Oy26dJj8iYMOJeOS5aJDAhTD2Wkvt5nQbHPjEyzKIV3EvGDPE27pI22gcFnv?=
 =?us-ascii?Q?Dm6dde5QLIAhjj9IiaQZHL0ej4wcXPdr82vlvLwAb6zTatC4maOeD18xbB7v?=
 =?us-ascii?Q?1Ic0e3HOWdStwATkgpe4l1ap5YPauRmroPxGoYvUf6av8qTqE91oG9eRT/hx?=
 =?us-ascii?Q?VO41fFYysKidJgNg5pCeRrJ4tuJiDVBHiK68fJYyqa6clOjuq/juwtde/qTm?=
 =?us-ascii?Q?sN2PlIh29V63+rHsYLhI8fdrjFFqa7Kb3OwUArqyKkgJcl7yeb+C+OxIq37D?=
 =?us-ascii?Q?6BcBVQWKg6hjRM57QiEd4nPX29EUN1jCJ4S11fUz176Y/rsp2YuuWFNkjPS2?=
 =?us-ascii?Q?YO2V7OE+rYkLXK2RMNrc9A/htWWYRE55wEikd4p9WKuf2hePu9xnEso01TUM?=
 =?us-ascii?Q?2VNOMkSgYYGDZM7SKBaoNM0cFOYGOAbs3XtEwxZNtRDkQGYplY/D4gVj3CXI?=
 =?us-ascii?Q?dvXiJghBFwasyFrPhnBIjWZ8Rt3xiJqNMbEKfsM/OlyK5P/QyUNmsggYUBeK?=
 =?us-ascii?Q?8bLoroVcYUeLqAljASHREkVSx83dTD08G6895FRDHMMScJ7lvkYIOy9Y30gC?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SsaVLtxo7PhIptRFTSN489jY6GfThSVrDPgmgDYzrDZ0VJimVuumzd/3U9EDpmzQYywPdEa24xgmHZFaUnDh/ibdgzfPZh/4dr0iuqgU+RGVJwAaDWKcMUOnPVBzz7XlfzA48VRwfglNP1G/hd1hyvzE8P7n/3J+pX2hoD3P7RCJCZgSZv3AuWBk64X0X+Kd3wzv5zxNDWTFgJfjoe+X6XLh7JujkUzO364tWyxh+HiAHy4dIsuLKCYoh0eEGjL34cWZ8m8y6FPaZbOqZjdaEYdyUrlRss6/PyQQh/hmq5JI6IoKj7XJFVwLSGIKMLy0HN8vapIYhezRbGFqDkBhu6+a5VO3eDpqkXlshhB/Mym3ewsBwdiolskK/UI/FzVuvlRcU/24ipLUDmZwjyuQowIjgxVTzl2CZWC/Wo3+A4+zhK/1gMkcIKJGjegM5qHcY3i/KdFg45iISRLxlixQqQvjlpkiAOkCfecGkeE1DDitehCFzKq+ZzkFNqr2JFJjhxq8qsvBWHbxJWiE/K+MSXz1UG5jwoKq/KHwR/Vua5xSuWO3547PYRs5eWsug5TpS0gdFPhn328nQFgXzON6QCX34LSF9JqNZi3lO6uq5r4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c5834e-5894-45e6-05c6-08ddd4f306d2
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:10:41.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlOqI6U5GejFZ+hE8JRMSfvoyZRtSivqNTsScnAWWuFkANA+68GmUGF7Do4G40+MU2DQn/F6A6MPgM8xKS9xlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5100
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060089
X-Proofpoint-ORIG-GUID: -p-gvuzsTl9fG_y4clgV9Zuv1odak2gq
X-Proofpoint-GUID: -p-gvuzsTl9fG_y4clgV9Zuv1odak2gq
X-Authority-Analysis: v=2.4 cv=QORoRhLL c=1 sm=1 tr=0 ts=68936265 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=k6h3xWvY_6i1drg9NpAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA4OSBTYWx0ZWRfX0wW3ILHSE8U8
 kj4npOAhDL1HAO8n2sYrLec3fWd65K1nzelUZNz7Zgx7LhMAbB/FCSkyjUyKZGXhcjQ8bXHM8Pm
 Iz8O6+dP9GOzVLr7U2umS4q2pPMptAFfi69VRDWAv7d3yMNmAtq26kXPdcVqGq2xHNjiMkpn7ah
 tFsv/RTk+ZjuToosCvEe6ToFTsCIt6S6/bfJU/KlRdFyObHLdwgrYsMpgRNNJn8EvyMli1gnhdm
 5zsOSDN1l0hKd+IaJV9OBk/khJgrpDRk0u+Y321AwAB5256bQ1DnKLVzOXCXZZwTXkT7r8MDZEi
 91//T6xNZTLjz42rFGrUO9YgFTFEGfz7VSZheIlkbHvfICgxYYHl73uPF5hAHaybVzVzbUruYGv
 ps1w8h4yyfvukGrf/ksZQowc5cjN/ePIbqhzNXWnt6WMYOCnx98FgQLahehAhY5SKCAR25Cn

Since 14.1.1-1.0.1.1 in June 2025, these have had the same name as
everywhere else: no numeric suffix.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 115cea60ec98b..2345ace1bc522 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -17,15 +17,6 @@
 %define with_libctf 0
 %endif
 
-# OL10 requires an explicit BPF toolset version.
-%if "%{?dist}" == ".el10"
-%define bpfv -14
-%define bpfc BPFC=bpf-unknown-none-gcc-14
-%else
-%define bpfv %{nil}
-%define bpfc %{nil}
-%endif
-
 # By default, do not build with 32-on-64 support.
 %define glibc32 %{nil}
 
@@ -58,7 +49,7 @@ BuildRequires: fuse3-devel >= 3.2.0
 %define maybe_use_fuse2 %{nil}
 %endif
 %{?systemd_requires}
-BuildRequires: gcc-bpf-unknown-none%{bpfv}
+BuildRequires: gcc-bpf-unknown-none
 BuildRequires: binutils-bpf-unknown-none
 %ifnarch aarch64
 Requires:     binutils
@@ -132,7 +123,7 @@ it always tests the installed DTrace.
 
 %build
 make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
-	%{bpfc} %{maybe_use_fuse2}
+	%{maybe_use_fuse2}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.

base-commit: b420f057c85b0a57bc31e106aa2440b2ada3a4ea
-- 
2.48.1.283.g18c60a128c

