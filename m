Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76626260578
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383459; cv=fail; b=ELnrFh3e0Qr2QLYCuIRVcTJQGQ/QcmbbcFCi7ON2LofmdZSQgEnT+MLMloEeMmJ7avDNkKbtZ1hLpE6mRFKZ72hwOpRS9PivOfYpagIdDQKXodOpjO6lP2WrUnHkviIjtqT6PFNS93G/RvgmMh6P6AFR3nlgb7pHMCaaVTf0JEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383459; c=relaxed/simple;
	bh=oSQWIPm7cueX+BwoPYens4SKQGI0nOYHbPfbQfjtLeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QK8OuFlaTXlT3m+Cu3LSG3LjaoFGBEv164xp+4OklebaGKp/Ko8RTM++62n5GJzzngVGg70D2jUgD+09w0YAQL6AZyqf3faWcDOqtnIQTNucknEtOa/uNfgBY8pFVban9FIibDpz9sA5L42NnE6gDdN5hiFjaGH+coVTFKisXqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ur57XBnG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BuHXxK9z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ur57XBnG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BuHXxK9z"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiqBA000440
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7X7CcmCLYo0VE7NbOZ
	Ivz+Z6zeZM3/PdsDqT/dQiiBI=; b=Ur57XBnGszyEAbqmapYpv2TUeUqSuaWp1m
	by+7ftmkEQnSkcTt1nIlkQq45fdt7po7BnBs75feS05vY2bvCJoHPKeCpiYSR/+K
	V5Bv5H4FylyQtxyvmJurzhzX5K/oj6EOQM683gYcIkr+J3FpYF4hcdmXKQoFQu6d
	lGixee3EegXvmHnO2Unm3nrzGTfgTJTIEKFkFXwIYEKtf5m4d5zqoBClneUYSmJ8
	lbeYiOgJIkVNj/mTLr4OfV1KcgW2kyp4Hz2p4YH66ibvcooxEEUIvLXC3iQEX712
	eqVOiiTToOWuKeBo8A12XC/a1z6++qkBma8ccisVuZH8DB7Ze4WQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2j7g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:57:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OHt3q4010266
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:57:35 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011007.outbound.protection.outlook.com [52.101.57.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc7ack-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:57:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNSCEcZANU68AxBMwplQvr7xASkFPtpdBr6z+ob7H2HuzJ9I9pawTgftJfQ2/X4hpv/MeWTVraDgCom0GYcFQs6FGGD8yrAFTe94TD1kS3p67UYFrLLmClRKg1A/luvHcVAzU+MTMCnU4sRvp8zbtu6qhjEpWwjKN33Pc94xvNRNh0l1E8X2vlJAoDt8HHJ2OUOqAegXAlmo3yf6q0dZGuYsBApubwxqrtj6KEFTOR3wuyPk4Mne2owfdfwtFScItp7/Hme7XnITnEFr+vYbNXOAbJdF9Z5A/7dk1mOJxOvIzytx6YYTH6/FiM7D3GxZDl5HVCa9e+csSs+drSe9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X7CcmCLYo0VE7NbOZIvz+Z6zeZM3/PdsDqT/dQiiBI=;
 b=yg5/3dFBod0oEH9NfTCjEWLUM5nDImdrd50PyAdGxec+2rbUIpyBS5K/4G2+YkgpJM7cZm62rMzzq5bhEsEmf9vbZAoI6+2Q9oIkUdvqcXmR4dwQ0OITCA7ZgEBs8xeQJWCxZ6w2sF/MEIOtfXPTERCR/fvDVOqWpQtugDmacqSJEL9bXpLDRw4KnK9fpy3m5jexDAy4S0MB7x3L7KtdC9u5qTNku1aslh/hfMPaN2QSuxoxF3yzWcQXCSoHB6EGmyeMQee266ObuE0NRpqkJ7JHpF3u98SIFTEvaYrHIHAy78HwrafkCBNDlCUPkXJrih8KJR+IGlkQVtsXoUkZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X7CcmCLYo0VE7NbOZIvz+Z6zeZM3/PdsDqT/dQiiBI=;
 b=BuHXxK9zPWK3xhPLqQWvpcHTrjo4LqDEtF3BMShjxoYweJc5wdRaXLPFq9a56Ut4scfsIWTdfzG0x7flQzbw8za4+WhK3TxJvfm+2u7iruspF4GDNlcSfXSr0m/0JtMNR6euSHr6j9TGfZv25VZoYihZ8cHg4o8WiGFFNg30/CU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6206.namprd10.prod.outlook.com (2603:10b6:8:89::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.22; Thu, 24 Jul 2025 18:57:29 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 18:57:28 +0000
Date: Thu, 24 Jul 2025 14:57:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>,
        DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Re: Test that PASSes but should not
Message-ID: <aIKCFoylntgaO6Gu@oracle.com>
References: <aIJsb0P4H6S+tO0k@oracle.com>
 <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
 <aIJ8mKI0nSZviJnc@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIJ8mKI0nSZviJnc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bce32cb-5448-4da6-5b1e-08ddcae3efef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CCxlJKBCZg6U0luIg3XiEC8KDYuBsTcdSU/nb/Vexzp4vklXkGKZoM4G0nwD?=
 =?us-ascii?Q?ljeDSwTuo1CdhKkjbso0qg8oqF6Q74k9ggRcgbzYPPZmALyibcznMH2IYZxo?=
 =?us-ascii?Q?rq6J4jCWNpG5JMw+ceGT8+uUXGgHySH5GLzHurzmfChJvJws7+pYr9BIj6zU?=
 =?us-ascii?Q?8S9vkKwzu0y9pbsxamne8GRo9AeJpLgQI2JndVFA8zT8BzVT0oS+Cb2C5kAS?=
 =?us-ascii?Q?xHOMWv1xcvwmDWzUe0LYMvwb2tClc/YlxILKS5LhSkRdWQf4xjzZMwvFC/Ax?=
 =?us-ascii?Q?nNvMaN03Ln6toGxOay2MzQasjyGCrhVcTli3SEsuWVGiz2LSooXoDaK0OxUO?=
 =?us-ascii?Q?tan+bWcG99Y5g8t0AFGj78ifbHFLrs5jVJZm/Jdi9gBmOE9mKAkHAkpMEwcK?=
 =?us-ascii?Q?dG5/fwrI7USPtYXrmkh+xzmcWZ1pPwfTr+pKD4rbJAwNLuWCd0DJ6i8+Sp5x?=
 =?us-ascii?Q?HncsVtR9yL6Re6DhL+tQuhLTIdjZq2wVwYFjo2QG6ZvyJju3Zr3588s24TVk?=
 =?us-ascii?Q?6Kl/on4i5+NcEtiFmIRajc98c9LiUh+1rZm63302igKgMI/AYvT+luVUuRgJ?=
 =?us-ascii?Q?gWlFvPfrftwZ6M+SpzXNRPExcZB9K2dABr+0dn6hDvsWwVxk+5ghUvWjcD0W?=
 =?us-ascii?Q?et5lqUW5FdWkZtFIkGKmPRAaTQFaQpBiv2Hu/SHtIsHV1rSuk+kP1x6jHAkN?=
 =?us-ascii?Q?0mWj2UmapUFUr8ERLVEC9AfLcndfJ3IjU7bD3JYld6EI/aN0GX5vJ9ul7cCC?=
 =?us-ascii?Q?u85pyO28A9Kbi/uhIGDHv8Bfpq5NDkpHgSgkWRYfV56e61FcC5UUS1f2R7uB?=
 =?us-ascii?Q?BO6G9+DDzp0rsLgQMZXwfxyRjAFp9IXD/r1YQ7Z0YJNyw2hGhGai/dW8NjJF?=
 =?us-ascii?Q?XF2Oj5mfuiAyAuEUM6YYOev1QbcEOkN+8X8zIaFmmJII2lO7ZBlMGqKpMgWg?=
 =?us-ascii?Q?KPmFzsyaO9LbN5vQpjeD3I+Zl9lJN0jyxC+nxvV4CTjRDUAHSLZVMmEnCDy3?=
 =?us-ascii?Q?UXnSeU4WjlMFV+JlP1G2vF6SbAqGReyriwq3RDCCHnwvNjyiiA+5GwnKCmhr?=
 =?us-ascii?Q?tg7JysGov6RiGSoygqeru5TrLZfQeSxpvgTCx4I54XIFlEZlkDvXHyXeQZWS?=
 =?us-ascii?Q?OwINIcjWvT8BhCkAdLiFXI+7a4eMcR9NQuOXdm7Fp+zv+4ZEAJ82lyIPHQid?=
 =?us-ascii?Q?+PiQE0g+AwegmItLchOfLwQXDqjE2SjhlD5Vh5DIrdZkHFyXBUzVPgjwOBNA?=
 =?us-ascii?Q?lqTDinQK+OT/AtT2MlD2//vPfq2C3Gmtw53B784ba+71HBOsReU5NcRjI5FR?=
 =?us-ascii?Q?tV9V54ou/E65bOHnyGokCxQzmRPg/z34A6kiNkoreDUZYPmr80dJqt6OJSVK?=
 =?us-ascii?Q?/PT/UpWADdE/TEwzgBsJ1u3v4z8+PYTjPqSKstf3t7K66AIQmNZSUcZgKQ/9?=
 =?us-ascii?Q?DxMZ15CyBO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TmmznoxZ1jiyJYsol3hnAkXLvwrEea85RZO/t3nyYOTgY9REnVLkREXKEVDt?=
 =?us-ascii?Q?N6ik1lWURSuEoxD0GQbrjpWsbJKraD4CaWR/al1MqtADEi5gNdkdjl1QiIl5?=
 =?us-ascii?Q?j+YGYqxOupSudavi+c1t/zfo0TbpAgmYrNnBxYd1XjSC7xxs/BJAFtvyz35K?=
 =?us-ascii?Q?AU8Mg5Vhydt3rkjWuKq6VhMqILFVOlUM66z8NAJD4sI6g+iJeYRnnYdQiTaJ?=
 =?us-ascii?Q?YERn0egNLjevXZNv37ngHgD2EQa+Uy4gI/4ykhba3Jmp/NYD5g6dfHbhRQ2M?=
 =?us-ascii?Q?x95u4AtPyYt21KZl8s6jAaTPndaSAVoki44zLJKFMORAdGkRWhaeatPlCwVa?=
 =?us-ascii?Q?YIHf0QIV3VK16JbxG5mIk2bsSpk4GNmBRFsJgYfDS3/KMIiTZ/bvCLwgT7eG?=
 =?us-ascii?Q?p0gilSiW35dNTlA+ya0zBaOCZyBJ+LNjyJF18by9faCF9nsWq4NDEwdhUbQa?=
 =?us-ascii?Q?uoeYNeMTXWq4tu+WPj3vNJLw2ewlQogRbsZ974C6BTN8pnofqy/uKAUdvypM?=
 =?us-ascii?Q?SQwaPwQepqQX7sllRe1DR22JuCUKupi/DUaC9iVe9yfhaYNoJeo1do3LmB/m?=
 =?us-ascii?Q?SzvtYdVV7sxHoXYAvJDw403c2FGePabtaul09G5JYC8sfwSoSXChm0LPbTO2?=
 =?us-ascii?Q?uWbvksm3glDrP0VgPyH+8dON10Jlw0asq7mbJ9SqiWfeJpz4TtBE0AkLYUNQ?=
 =?us-ascii?Q?j3eNbJGFCE2AAJlY8i+Bswi/3rVUxzG7o+ctGl42WwZ76SqUq3+iexLKcQgJ?=
 =?us-ascii?Q?OtGIvQI92f9slE8+4oqLj0kR9DY4RG+La6war7nrM0G3DVw8BJqPg+yRmnrT?=
 =?us-ascii?Q?00wTaeRmtEV1IPFjup4KSGpDwdguHFNjXz09Wk/dYU+NMKti2AhpYl+GTh9w?=
 =?us-ascii?Q?CpGPGab+TDsp7jncKzEsWYftPjoOB1OT0I4uuIt2VkbVW7rq24x23V7p/nbj?=
 =?us-ascii?Q?JrSdazuQfRwJsWRtKrACaQCnVHeR0C/hxGzIoGXItFej2DN3o2N9QI6Ld8on?=
 =?us-ascii?Q?fGzz3haYPbV71HAYGM8bTPvZW4sr4PxleyavYht60rUg6ZOaFtNnwsHTIH/E?=
 =?us-ascii?Q?HUXTgOpycT8a/wwCQ8jvW7fXptTJPkC3IY1IxF+XBOA8ObcqB19WRNqNuEH7?=
 =?us-ascii?Q?lO/fRCyhGD+3FzfDUNR5FbM75jYpj7M0fVujJLyFuH/YC18g3Cjw9kImDSGX?=
 =?us-ascii?Q?H3G4LLAsGmbFNVZd0dJPVZLQ8HfWMi5Ntv7DLXS06E8mcxyFCAchJqEMzN4V?=
 =?us-ascii?Q?lM02+hiIkNKYwac+s3S9Clx61Pw1/NTrEQtKMWM+GnyDdMYGpsNlACIPDg8K?=
 =?us-ascii?Q?ZtpV9bm/JWEc0xdXziCUt8alRztupX+cCqN3WzbKX6I5WJFPcfWihAA95v8F?=
 =?us-ascii?Q?gPZbmRZsI5+AgjiY/VdwII+8v+W51vQFHo4SD7fqJEPH9PMWVtmqe5uMY+YD?=
 =?us-ascii?Q?5Gh3AG89mC84zO6MStsTtILfJqsZZ91+Z+p4hPVKqd3dLK1My0Paq8EIF5p6?=
 =?us-ascii?Q?q7KCrocga6Fj41/E/Fe8CefosKq0uJaTFpfbT3Rv1nvRxMHX+IqZII6TgSyR?=
 =?us-ascii?Q?22wq6+OoG+kk2e6VPOaUu3PMa/bxhl5M6OM2Y3MAIhvZ7caoXaA3VjE2UFYf?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6HPs4bfc5tWV90yC7hBgVBu25azdoxE0dN8ptqSXPAM9/k+60/XjNGwJJtmMWsjbl8TPtmg1MBowZnP1SnVpJP0sc1GR8NWVjR0sl1o92BibRAiBxNL9yTx3l27GieEf9F7wH434TJM+eIKHCKX50FUV2fBa0mVf6OHR70IU8CdiD5pnZp+JL4UfrdSvC7YArb/FZPC4ht362pWBcfTOCNmWEva6Hiz5u+k9LKjoCBBQX/9NZAxRncdlxYSApHaz8+g/TOY5fY4uCiZ5cSh2UNcBn91Fva6PW8ZGNHrAQ+ME1XKgrVN0rZ2LsZNvXUsvNxVbCxllRhdvdZZwabD8PiAjLkfUbEpp5TlfjDp+++9ueOyTpqBft0EF86lJ+RbevPZko4BZGTsE6g0nrTFyA76h7fJWKZay0V+vei+i/qru1EDn41nlqxmDAAGFsrga7kfLMilD9tnlt+GNLaBxWjJ8ZAhdeELU6ESmhV7ABVUaaN1ujIOsIBmu74aiiFPidiGx2A1V09JskV9k8CLdqjHA52PT3PEm/7/3bngoLQgQ7YidPwvC01bZfK0vxxgWWnzvHpuQtZm6gvZNlYGqdXp9D/ypME9Lw70SDxlcvo4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bce32cb-5448-4da6-5b1e-08ddcae3efef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 18:57:28.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDud4/XARSwm07xf023uCYVzKdhKhKQphC6Rsot9Zc6rjarDo0V+GNq7JiIux+n4auopmPZGv0A8ovGzU4B9GeMXyyvaMMiiMmgl59LF534=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=957 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240146
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=68828220 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=bf9kuow8eLnNcERe7UMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: om4Ke_lEZ5SrdAtRRDeD27N0ObgwI8JJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0NiBTYWx0ZWRfX7+s3eVvPxk4e
 exjvpGV2XK5g+wCP86VvfO4NB5Y/arWGE1ilCMY3lLBltX/FmgJm1g2jHxC1lbtIe7qhBCb4yTp
 D85oQvKFugzGsF2IhV0crN+27M7Fist3hGqvKXr7fLY6QQil/2aiXX4fumXo/AdsofmTSYUSx2A
 B/vehJKEbuPLNkjwjdl5+RERXLUPX3nGdlZVyVsWEmVOFYlQ0IJdHKIeAJbzbAXfPZHNWkDaOe+
 84ikuttaCcVfGBt3rMdaeKg8z7EvU49WlDLtrotpYS/oBz02rxDSbMM9bE1ddcavFNKQztKFhgw
 yoOtu2DAB5V5Mc/zm182fgXkOV9BjvGuZXt0MOS2nQjzr4Dn1dpD0l8RwdyuABKuQKduGifAQX3
 rCrU5i2jnXOapBR1G56b/8AhEHOGeZyjGBBlPT7+ULUDmnCHSD1SQPIvyjWhCiTNnrkc/81e
X-Proofpoint-ORIG-GUID: om4Ke_lEZ5SrdAtRRDeD27N0ObgwI8JJ

On Thu, Jul 24, 2025 at 02:34:00PM -0400, Kris Van Hees wrote:
> On Thu, Jul 24, 2025 at 02:21:36PM -0400, Eugene Loh wrote:
> > And yet it has a .r file?
> 
> Yes, the problem is less with the test and more with something going wrong with
> BTF handling causing the probe to not have a BTF ID and yet it is trying to
> load a program for it.  Attachment should not even be tried in that case.
> 
> Working out what is wrong and fixing.

Patch posted.  Was an issue with the BTF ID lookup code handling modules
whose BTF data didn't get initialized yet.
