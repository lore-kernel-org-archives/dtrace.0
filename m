Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7A4A1A
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742266208; cv=fail; b=lIc0FQWL1IRNwPwSv+FtPrPk/oRZU6FtaLZ1KhVO1kfMlhlKfgpsrgnVt9Hm6OdpRTqLtiLkaoeJ4iJsP9fv0UHnev8fxXjOYvY57K0uUULCpmnbaQWBgxr9l8MKeKua3f5lNZ/UX6krNs8/lN2onth8zczwK+nDsz+jm6BvCro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742266208; c=relaxed/simple;
	bh=1AHuO8+SkyJSkFG+BArm7ZWb983Pm4Cxplw6rpJmRx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZx71jDNsBqzRctE7vuwpGxR/AXQNYOXJdQvvxTYemzAhXC3gkQEdjJl9cccEhC2Q9Ab4KGksTR3t39j0M412IkfRWcwtt2Lz4fdplemyTkLR91bZZqRN5s1vGv2z9Z4A2vW+llyo1rJIAB1oS0SG+gCSa3EdqGZopvjRHbdfXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YZHmFQpY; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b+8IF4za reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YZHmFQpY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b+8IF4za"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HLttd7022529
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 02:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wzr7aGK+RQhxJWXHYK7SODJZxp58p0UmyZkqfIBnxU8=; b=
	YZHmFQpYRM1Dlf39dnAdlnXVFCbTmXROw2yt0EM6OiwB+JYj3Ar4i9YjP2nrbLK+
	TU7wybevkRe0JW9N4j2wkyjrrdNHrcHLcGRa9EJsr9s+9nz9z5RCSEswMLnFG5Ni
	vAyaYrDORmQlhS6J1I35lAoDh62lb9kiUIhJIwm/i7rzu4uhH94oHhuhZWzmIQMA
	oPJ20M438XAgQdq/qC1qFZ9SGYG9SHZE2I9ug9KPT3PLvYtJKCqZMXaSaZH+9zsP
	HLzsI5AUinnAY2BdPQ92V/LAOs5fYm5UXRjrjGsisPAc3enOsIh+LlU0EYS4SUqG
	cKjAPLTbqg96zBZiQhDZ1g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1n8c731-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 02:50:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52I292ZR024432
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 02:50:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbgqyfx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 02:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUBC8dSmUdJz/VBon0aCNFUcMGmCbTf0ufdXSc6hJy+TUeyeQYEtLzwDo/tK0GA76RjmiLuLIFtPaSxlIHMy8ED/Hs5FGLiOX8zFvmo3R1SPjpsr11y8oe7c4/jrn0ezPfiIx2lGx7kPOwwXMM602bDAvB3Cnne2FJV3njQh+aj/ntdsA2or1DYf2c6sodVRiVuZZF2gGluQZ+GmO7+bauAY2KOsaey22pi91cNmwKjyUhQbH0f785RtxCxf4V/ktkOtazvIg10Mbt+drg2jvVLTS1enOsJIhCyO+k7Yk2tvslAEvaSBlxBymwv5EkCJ4PfnQ2yQzZzm9hwstJ0/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbnCGbZ2U7VNJKWajzYaLLbkL5xT5ZysOdfTweJgtlA=;
 b=RvrGsHfx1PmIYxScmO3UuAOPp1eu1HZJjKvZwaGxREstbAIa1ttE3YJdNBlYwwvETR5NKbEuvYLl1nGJbRO+Auv2XKtxLKZSsC4+Q35Zb5NxVowSylknxmaIA9mZ63nwZo0zSjicV9c4lk6bOQga/Z6m4/9yXCmKRRb9Oeye/yYQbPDGjduahTsVnZcr5nk2OLMu5P9e3fIX4w7Z4DjZ35qpBaZVrA0lW1HWlwfvR4e0v618lFFS4cRwbNsuJLR6Kt/OEqdMdn0oKw6bvZfHy6u0pEFhivwFciW42+7Vfc77uUTS7kSjxfyXAidm4VijeWokD5P3eQChjTVWrSzMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbnCGbZ2U7VNJKWajzYaLLbkL5xT5ZysOdfTweJgtlA=;
 b=b+8IF4za8xnWdzrfF374cAfiEgofTyAMZmqlTQv/4vRSJtnJQEaM9MwbtAqeK2Ex8s6uU2ARg0LL2RPEv74XLFo0O3M2kWyiZsFKdRekkKqEC2D42cTeCnXHUYlVVaivOiWFWUlQ39nDFzkgxoK3B6jcu9Q4jc2SfrQjs3WLSr8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH7PR10MB6627.namprd10.prod.outlook.com (2603:10b6:510:20a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:50:00 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:50:00 +0000
Date: Mon, 17 Mar 2025 22:49:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] bpf: fix have_attach_type() detection
Message-ID: <Z9jfVWtF7bekDbP8@oracle.com>
References: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
 <e0f0aafb-d76a-56ee-2e12-36f19da409d1@oracle.com>
 <Z9iEGTtQ5UwxFkKm@oracle.com>
 <8ec65b3f-4b6e-f6ef-fc3b-3a3117f581ab@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ec65b3f-4b6e-f6ef-fc3b-3a3117f581ab@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH7PR10MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: bd635b5a-b107-4785-d81f-08dd65c79387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?hkll24l6lWu9OWVNDlJ2KyQh4D5UiWgPcZCeM3SGL6IXHLZlqFdxL0vbET?=
 =?iso-8859-1?Q?hX5H2LaQfCQ0hu1SFA1nWGodVRbFcfkLjEVbVuQYFOZuswCAcYzflGbOIk?=
 =?iso-8859-1?Q?jTgJNo8F2wry+ON2w0yNNJJPwReahRo1Awdd54Eq6NTaPek/Q5Wk1ZSC6J?=
 =?iso-8859-1?Q?XRB086FsSG0gnWqQwBeys1YCJdOTOEWx4rzBnT3GgMo71DXTvMOI5DHBdZ?=
 =?iso-8859-1?Q?DnhINAKvgzjNi1VskE47/nev4Pzw331RvQDLfTYNgi9TWLYqwelzqbNMIL?=
 =?iso-8859-1?Q?rph7EIgXW+AppY2DES2ipXqqaDIvMD1+zvxOil1GamZvLI/UxxkzkHk5Wu?=
 =?iso-8859-1?Q?ZbLVIzhj+vdC25hPqcDhqhgQxeNMcm5r9sM5ZVkwt0WdUs9UKYsCNZXIQF?=
 =?iso-8859-1?Q?lyH55OwbX0DdyrP7D+SjrF28IW3mQrkJ7rj2ceWtDrxU/mAwjFdS0T+QIx?=
 =?iso-8859-1?Q?/RqdXt+LYvuhuJP1smQceg/qCBx4sY+BqjOGJk3xLPsq5qGwzhIjHHpbJf?=
 =?iso-8859-1?Q?TeD7hSMV0NkR9dpwclWqdW8D7f4UMzs3XBQWpZpKHSYt7lHXVlLQgxdUgU?=
 =?iso-8859-1?Q?CisLcacnQTR/jvrCz/lgWoFAccAu7Fn/N/vRGhGzO4IbHaMMkxje7rC9KC?=
 =?iso-8859-1?Q?/UfkQoSeemzAYqI7ZcIKf8DSBsLNXCt/q0I5jd2mo3hx/NNLj1mI4pCYY2?=
 =?iso-8859-1?Q?HKuelF+X++oK5ltjSRAWZWtAhdeUgNhuvDRVUTGcJRZEEZI+Sk5zjkAsgy?=
 =?iso-8859-1?Q?lK3X+V21q+HU47GBfgiUamqT3bbPBaFp9Zw87EuMLnB+LrWo7aNGSdezw/?=
 =?iso-8859-1?Q?QErlVpE/XUeHEjc6NyZgDKPri9mRklrMdd1mSUXwKxf7eMhU71bPkd5o+M?=
 =?iso-8859-1?Q?uVgHFS41YoT3ryxNYBMHIUaLGIECq/q/TfrbM/2oDUNeaqEZPuQ2tePwV5?=
 =?iso-8859-1?Q?T8pCvf78UoNGLPXBOhxoaRtFienZjWh6zYKwUSbJRTBd7cQoku3d7YmtE/?=
 =?iso-8859-1?Q?zbkBxAXbHvRk4f8SVRAk5BpenuTelAmEjVyO/zNKD2h/yU2y5lAnpVkbI4?=
 =?iso-8859-1?Q?mh3SMpadJk+x+X+ZyY+u0Otx0nybK451+riu1IHaddaBJklSfmjcFDjyOQ?=
 =?iso-8859-1?Q?jFM7EeuoquZOtrvmQDf/e9VWVD86TPVFxVYY3DTngawthOrbUQapRqBuwv?=
 =?iso-8859-1?Q?smjCG//Q8fpn+wM9ZV9p3+xmaOb9U8/kpNcJ2Nei/PgpndTWy8C6VkVaLP?=
 =?iso-8859-1?Q?FRx/8cXqMctzHnIiGfXue4J7I2Ga6ee9KldXg8sZOsDgag5PCSzQyeVFoH?=
 =?iso-8859-1?Q?SBdIhpLkyNGdYWRNilueVfY+UkNDkg96ZT1JaXhflj4xAnyOA79iSZOEt8?=
 =?iso-8859-1?Q?xfswW8p3gPnlmFagF9DRysgWXKhy7B/4EFXBNggmPT5RBz8wrpaC+W6XL1?=
 =?iso-8859-1?Q?nenAg/r49XOSLvZk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bTilvu4CLmtcRcWwFtkeGBG4mpwkQf4GviEXD4uM+C0QwFksQH7sQpmtun?=
 =?iso-8859-1?Q?oEjj3MJqRInRqkWxbc8XnCxH3AasuVkUbiLA0+0xM70J0R2NLoBN/7zKUn?=
 =?iso-8859-1?Q?2VKMrp51btytxlJ/lnQOj3lN1hHn+0ts6x+fZwAv/pXFnXbJN+Y2PXBF92?=
 =?iso-8859-1?Q?aOi6mNA1pbc2wlWVhz7i8cyzb1ZjDzGN+2aVHcbxfgfPc2O4krRQSuD5Uk?=
 =?iso-8859-1?Q?9QglcXQmc8yozPMjXj0IFb1ZWJgkCoNDj1MXI8Q2HP9smE5RntyNbd3KPC?=
 =?iso-8859-1?Q?5mso0nkzP0eMzn6C1msrU+tGzVebqomvJmJ5n97MUjA/8aglzDqnDJjXaR?=
 =?iso-8859-1?Q?t9Zg13VU86zunC0B2Ti/YxS0A+Bydx7nc/Q3ANPZoN69OKLQ2ipNPuJJBT?=
 =?iso-8859-1?Q?BwwbfDwrpql8zcQr/sZ9lEW6X8qsEyPjGZaATdkoTqlIxN77Uhj1CcH6sl?=
 =?iso-8859-1?Q?T2KLzWF1sVhTPhuDtwAznguIhVDilp3OhpL7V9DVLUL0HBuxaeYCGtasiK?=
 =?iso-8859-1?Q?ipUDRFAVAU9g5vHN6KzuYr1PieMIbuvdpKU41F8bU8LWDxfeWEzxcleifg?=
 =?iso-8859-1?Q?Wpfn/v3oNrLnbYOzA3fshJrdltgPOPFuShnlh+1noO2NwmE/Za3hmAWPSE?=
 =?iso-8859-1?Q?UNueQI3b5lrvTb7g5ZkBut7vD4Gap72VQX0uYszYdUir9195jGnjB8rCy5?=
 =?iso-8859-1?Q?GnQZJd1EoPBUPc4kVDWJAliyjNWu78ODmqzHjKzDw6Bq75CyQAXtZMQ94C?=
 =?iso-8859-1?Q?zI0UTcP4rvpi6NidD13SnxOzOanJSqLTsaUYhJrm4yY99CszyxU/eH5S5/?=
 =?iso-8859-1?Q?HX8YDXRrlR7KvXraAXQ7Og5n4hkfvio9IGWJ9fBqQzvwozi7wTg5AL10Mw?=
 =?iso-8859-1?Q?vpSwRpx7R297p+aS3sfS74XcPFj5KQQLrHQgo6sAIULfYbgu+C8fnfa6LT?=
 =?iso-8859-1?Q?j2q9VL+ZNWvDfm1XWBOGN3zhuYOZPUS+rKi8m8eD+sG4qls0Vtb/RDRvie?=
 =?iso-8859-1?Q?eDrZIolcyf9VtsaPp/HYr3aV1Tx+qJejBNOVDzq1u3SyVoMunKEWrlOZ2t?=
 =?iso-8859-1?Q?cHruUU1z3M3/Q6GJ5nbuyesVrs7wKKVrObNKmY0BaE74TyJLutmktfDv/W?=
 =?iso-8859-1?Q?yeUxnI4dxIX+v0B6GW9hBvNzoXZ+YWuIRDF+konbyN7PxJpO+kQGiEDNRA?=
 =?iso-8859-1?Q?0/EoU6P4t2ihqT2QjqLcB9MDeJxmxx2xjYr83fh0YR0VvDJcw9bQVWpQL7?=
 =?iso-8859-1?Q?Cyt7bSkTLV+PbH8zlseX/CMOBgMw8hQPPPNMJ/Xa7TD/g8CFbxvHqY+tsp?=
 =?iso-8859-1?Q?uzGnXKSX51MX6t9vuyIs4Q2iFgtsmKQrnn85WjyAWo0f5pez/rQSrRuZvO?=
 =?iso-8859-1?Q?nvco/z/mlNpePerXB8vPBWmsrUawYskKslUGvbqkAQdzTmpocvJfQojZqM?=
 =?iso-8859-1?Q?BYJc/wF3LjY53bzGzRAVpm9pT5M1HGdeB5WZBLgMz71YCuodzKAHzDXYWu?=
 =?iso-8859-1?Q?GWLJ6SlIXqtabKq5vYxgYOQlgGtyJmIjKPPLsY2vpswT5P4weawuCM0YWM?=
 =?iso-8859-1?Q?Yf7ubJOvt5ygcAicA8sdldPZ1rLlsa5zHiF2P+AcLIZHuyEe2QIFGMEDId?=
 =?iso-8859-1?Q?Oudy5I3xN8G1cN5pJuizftOxsrXBbOFTEVL2k/In2Vv4wt8GnvOF2clw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	incahDtuRST6xgexqEqcGE8QyUShPboDo1gXRMqcwzM9cHy3cbvBgIZR/9HXlnhB1ZC2ja5VZNGETY2yIViW1O3e7kuOHJQIQjn2lsj/exFra7DPrdeeCWLTSat/aocKbYl3QNy8kX8sGtNtfhZ7SCdIL07DLRYeG5N5tmSBTqe9xMMAWxqeUyGU0tq1YeiAGPiEAo8MfNrA2ab6IsLIXGrj9MYc1VMdn9RraQy7cLx+VqIa5/eQYZum8z0T2GqLr3sxM5x0HwPvwGV28sfNs2jx4y8viNRPjdg6aRVVp1ALBhldWyavCiS2E29qlnbt1mzWIkNqKdpFQLcyzjvMwsI9a/glYWtlFVd0xfAxtUVXGaF8+VbVECiXD1OkykIUb4CWa8piu8sA8Cw7ggo2b8GL67U9t4ls/Cp0UVb+vUlqwe52dUoUp+8qks/AxTMJohOvVrbPZctJlOl3jM7FntEnjoxcyHvI/m4HQ01EIK+pJauyt+DETIj906dLVS9cy6NwKREgo+cRhE2OZvMueFwEhTAXg64bkHPN0e4njv52LxHfSR8y0IRXkqKBH/GagfGgcABAx1V3Ide+KzMbB1jIIrntNCSXX/kz595AacM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd635b5a-b107-4785-d81f-08dd65c79387
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 02:50:00.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IU0deVV7dyszdVopFvNS9EKg7MOopbBp0xQfxSuoN0RuGjObbvEU04w9eZGpqoTt2EnJT5YK12btbQFbcMscHvtQ0U9IGe3eHh8dKt3G8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6627
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180018
X-Proofpoint-ORIG-GUID: BvwLUa3p7zBEZhUrLmU7WHZ75JW9fkWD
X-Proofpoint-GUID: BvwLUa3p7zBEZhUrLmU7WHZ75JW9fkWD

On Mon, Mar 17, 2025 at 09:36:56PM -0400, Eugene Loh wrote:
> On 3/17/25 16:20, Kris Van Hees wrote:
> 
> > On Mon, Mar 17, 2025 at 04:16:01PM -0400, Eugene Loh wrote:
> > 
> > > In what order will patches be applied?  I vote for these two ahead of the
> > > 8-patch perf series.
> > I really prefer the opposite order, mainly because the performance improvements
> > really help with speeding up the testsuite runs.
> 
> Maybe it won't matter, but the question is what one is looking for when one
> patch set is in and the other is not.  One choice is that one gets bad tests
> results... but at least they'll be faster.  The other choice is that the
> test results will still be as slow as before, but at least they'll be
> meaningful.  I vote for the latter.  (I guess the other question is what
> platform one is talking about...)  Anyhow, I vote for correctness before
> speed, but maybe we'll only test all patches at once.

There is not really an option here of having one patch set in and not the
other, so it doesn't really matter.  The perf series does not introduce any
new regressions as far as I can see, so there is no downside to applying it
first yet there is a significant benefit in terms of speeding up testing.  The
attach-type patches work around a problem with a range of kernels, which is a
problem that preceeds the perf-series already, and that fix will definitely be
in the tree right after the perf-series so the end result is good.

If easier, feel free to consider them altogether a single series rather than
two series.

