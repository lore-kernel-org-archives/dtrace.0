Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C571C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466547; cv=fail; b=habA7w9BX1WpXdm6CikNSbFv0VC0N2AkzuQnLSntxxDRgQfULLa7R/P7QjxTbn0fccYGnNiZn8cB7/jgB58v6kcEWEAOHkB0uvTk2q+xMtAIs/Z353LQAL6oS4W/0+Xq8Llas8wUsLO7dCYAEk1wWitQBpL2tx9xmXLB5NnCMPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466547; c=relaxed/simple;
	bh=FQlBPZ8SKuj8R3S8j00PEPeCTAKW2ZSX/uPOumoPZ/8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mWcEc+J9eWQhmiVw4/4PRvB8xnjHndNoV0kCVGQdYn88MLKUN4kBk+G8NMch+ua8jc6l7DsFka/pwff7jp2ylc6Is19KIjfbuwVo2V6yRJ/6Y4VuV33VkW+8jt7uTBsJ+sd6+7hWex5DWvcn/CijV6Cf7CuvGxwq8m9UeH7YuGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XE6dEFIp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VsB/L4Yk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XE6dEFIp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VsB/L4Yk"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMsl7031036
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=99L+l9kian1d+u
	/CpUMxweqLbuD09gMumQtS4si1qSo=; b=XE6dEFIppWPYXtul3KXQSFH+dcWHNQ
	Za9k6bzEDoL8+Pc3YHlg5dG8hO1gsWus4DUocaxQtcx8wkGQ0UtL4YXlkufI6SGl
	QEHaRvnH+RCXdcMh83BG/J7UnLowlWIwobCwloCtXEWXCKB288yR35CeI3ANxuNn
	CGBbL4xk9AmL8/KSw3Rb1VtJU65rOm4Px65/yXvV/Y7PERg54SDfml9bkFwDnkdp
	d6dyAzuL9TJG+6NztymPPNmb+D2fLJ31qReAqDnfgoFO9/oa7WTmPAY4jH30JOps
	QUwwr/pzDaUozf0deBP6vOT0wNHqBtaSmp6ahEAg6XkckKe7d4CSHM3Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb525u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R48KTq017795
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v7bx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA8RHNKi4gclt8WZe1GG0qcd3SLgbPC5+LE+5eK0THv9L/9EBXWpEhpKpd+WBhYtMHHANYwUNOMiY6xJOGva1HtNFnsJc8VX+JmiZmVUqdS4UmXjhvG06GaQEDVlo6pd168ijCjYxGTnooC2VTN0/7a+ur6sI/r/G5uaycnbac3fZr3jV7rILu4qlGjiHSOZfo31z6FvHywmDjDpjcUaIXFN9PUeMcm5myOSxyZNRbjJqd5idef/Ap7W16ZC1q7l8jyUMHdsaxcDuST1ceGmpX6l9VwuopgfvGoJR/KvSDEygPM+QzA+w8h7dm3DQLGp939GwAjquVYTytPymmHAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99L+l9kian1d+u/CpUMxweqLbuD09gMumQtS4si1qSo=;
 b=lrB7CN02J19pXrqFMcvDy5yuO8RqI1XVZWykEm6NaXYwLsEXUpgSfJWvxLBaRxHmtNz8Tlw4eNTQqcCHGIV349zKXPq//iGQMmPAFiIcCW+o7lYGCmbs2NDZT3ipVhtw28jlTExrmnDo7MpBgVf3W5OT+FBgkk/ai3tLgBA/MAzteaMsni28ywEblq7+e8+4kWt2R1LdBAR2IK7a38kAFbrE4nJevsEwn1rpOhreZYiiWGL0CD1ExOANwgQ+Ul+EZuCUFhxdzl4gJuSgWh1dQqWbLo0D77Jfgj+fbdqrE6cLg3xXelh1JqasXtkHLWeC9QAIBhVCGn+w5VcIFtFjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99L+l9kian1d+u/CpUMxweqLbuD09gMumQtS4si1qSo=;
 b=VsB/L4YkoEnq0xE7FK05Ii0FARcHyu9tFN01F9aebfzPBcEAQSz0z17OXj5DXL/xrQRTgAzKSsS4SThUrCxc67o8C3dLZj89OM6IZ02mH39HZgt5vhOSoVjOksn+EGfBUTnTYaLlmJys2COYdsUubvjvZvze5ZBR6UHsYhQfLWE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 17/38] Add a provider-specific probe_add_clause handle
Date: Thu, 27 Jun 2024 01:34:34 -0400
Message-Id: <20240627053455.21567-18-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 629d24d5-298c-4cf2-5215-08dc966afc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P2miBaOrda4esGJERn8ldoqv/cGvF1B4ueSPznqMxz2FunLTCvyv03pbffpm?=
 =?us-ascii?Q?hBp3wAbHQFK/sIk7p6AGI3hpiuLft4FUFzB+Gkf+NH9xvtICgGXtnAE6H0Pg?=
 =?us-ascii?Q?QoZWfICDleb8T6K0BnzumCZ/e+o4uF5cbFqKV6+XPJ3ACT6XM5unEHLTy7qO?=
 =?us-ascii?Q?rSCEVMveOb/6RvC5YmdBtw5g/yuD3V2fLB/YFa8veLsBt6+Cz46YQsaRS/HT?=
 =?us-ascii?Q?nXoxpBAwaTAaru5hdwXH32is52fG+Usk6RrzHI0g7tn4rRRpexTYkgND8kTg?=
 =?us-ascii?Q?n51yVxsbL3Mv44js8BKRAVM3B/8mJVJE1u1XMsdNzUM34F+vwsyNRmVgnjyx?=
 =?us-ascii?Q?tYu4rXaFR+h5PLHtSk9l5qyFWOeTg3QpuPPEBtQbOQs20FLDpf6V+3rZlgCO?=
 =?us-ascii?Q?dc2ApYyRGmc5gfsL+MqoPAjS4Izfsz/IihsyAFsvrdrm4jD91zM2KUJ4k++r?=
 =?us-ascii?Q?/0QCp1ZSsLBRDzP8dja10zu9xA170effyhd2W4aB4F2eNtz4HvrWOF+2tL8j?=
 =?us-ascii?Q?3QGg1LJx4PEHHWhWd4ZV3fZXADm8rDQ8rym5xUHHhijQxGuBn7OJONPui9Ui?=
 =?us-ascii?Q?jP1eExqmCrwCFOCGjec6rBMuPzrmb+pOIQmS2gE2lydKP4tyPIpkYot2rKAJ?=
 =?us-ascii?Q?AQaDRybRwKc6aP3goJMEabz2gTvzIXFAGF0/nwNykxq10sTlFQMIdwwyaxSA?=
 =?us-ascii?Q?eQpQVLDrG0K05B4ndpDqK2TE8FVUxfdHtLT0N3D56RJ+5nkIYTe1Cf4N3or3?=
 =?us-ascii?Q?V+vqCOLURa8IgoH3e4BcgemOB83yppRRIT3CDac2wrtcnFBlJugegHpuro3S?=
 =?us-ascii?Q?HBltKz1A37vqYV1dvy2M4cbjXGy+xMJRvl4RPCO5vFTtO0zhqRbPFHGae8Tm?=
 =?us-ascii?Q?kfNo+xWxjHUnZCEa/FccsswiREp1TuJrB5Ii76u/aJIdgrx/mcZsaZapexsn?=
 =?us-ascii?Q?E4k7y4iJBG1D+7axBggnwtVoz1mOfuKTmeshuut2HtXeFO71tYeR5XxTiiAY?=
 =?us-ascii?Q?/yPhxqjP1Yep761kjp72/LtKdHn7yXWncnJwcIuhvunZnfXMZqPJoxOB3DG8?=
 =?us-ascii?Q?Wa+9JoLYfYdQ9Zw/ACG8flN8qNdtPG3AkFvWfqmMkzhrRx/hSeVdxrFudDsa?=
 =?us-ascii?Q?/AJPF8h+2J0EFEGKiHRoqRkCMbinwsyWy9roodbzmZmmQoOCYoSTTMUQPVgr?=
 =?us-ascii?Q?ktkJJDpIB51Mj9nbK4veAUk7neCw1lRLGzy5SpYgWQe2qj5BtmTqOFKfP2LS?=
 =?us-ascii?Q?kqlhCr01UXg2i5FvB1uUhD81erZO1Olc+MsVppFquZJSW1zwadUtE6rnSRuo?=
 =?us-ascii?Q?U3N/EYGdmrgFfPQZNWVTT3AxiTVQd+Q6Lsfa3mMZ5kQtbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lfyYTPEX4dKAPyI4IkhOcCshkyKtXv823SUEA6+LhdyMm4GvTE2fjUYmiXp5?=
 =?us-ascii?Q?lFCa4oZ1Tscx0zaQKtnasR3nqcc01jjsijPayRn5cmeq2e8rxBdZ8HIZ4+CK?=
 =?us-ascii?Q?NUMVuuG8aLBHGrKJNXyxfGbAvamsz/UOBZckM3ilVmEssB49zgx/msRtgrCb?=
 =?us-ascii?Q?YOccEMlxNKSIDaQ/txW3pQ/BoBYKCcvExzDjSnlkyO1QsxNsEHktfJ1SpbHN?=
 =?us-ascii?Q?BrZh4bD18KlVmy3vVM0F4EV9j9Dwcg/RJvcvEaCYKz3nSDgQSK0TodlbWs4o?=
 =?us-ascii?Q?A+Jc7317sC9ilJpxK8xwo3u8Jl4V3CBshJAF/wyKTCWo0oLYwIqeL+IpyBj9?=
 =?us-ascii?Q?dDg/mzZSrLN0juz2jbIuBFech97BDAuPccIvPc/z4GhUgodtb2HqxuIa4RpO?=
 =?us-ascii?Q?R5osAFiUUmF3NTX3Q9SLliSxVllIFDyf8eu9RwLm5gF8KnaMbOE3kFdJgd75?=
 =?us-ascii?Q?cL6yXGlZGZdRoW0hCzuOSKiCGm7j3OvWFE5gTVG/ujVp7HZ+nF7qAH738Qty?=
 =?us-ascii?Q?toc4rNx015/lI0WQGO4lcMyUhehcjxlisi/+twyXde8sYJxaLo6JR7D9mRsM?=
 =?us-ascii?Q?q6hj+LHw0RACPF7iaasKwAiK0gSOzYWHTgxGANYMeRod9Cib4ZsyCX8UTFKN?=
 =?us-ascii?Q?l+r8kOIY8yOOCT9VbRaPWo2ToS2n7YsW94zdf9DH3GtkOXf/vwnVM0bS8Z3I?=
 =?us-ascii?Q?QxXZw7sKOmezw4/RZEZ6wOwZsMXpthkJoim0VcKXJ3iFHs30EDAgOvfEJNxO?=
 =?us-ascii?Q?HBOFJU2YF3zfYTZCBwapR+J3ArMbEqjdtvt8DEU7xx88HXE8Tr9bRLNIGzG5?=
 =?us-ascii?Q?iSmdBNs3xMH5NMF/Ov72DILR8DfqqGiBgj9c8QO7Ty8bVRzmDOQKGrhgNxxU?=
 =?us-ascii?Q?AE7H3MO/TLB9cwUmPeQfh0oORlV+olJOtcRxBrilBd+FHhW7eqVIHKCJWiii?=
 =?us-ascii?Q?AYjaIAjCYOAbSFc9+DPbLUSZFQLsu+qS6PBFjPxuOfCfJ809FI2jWgbF7UMC?=
 =?us-ascii?Q?7we2uTfpeFrx7VXoOIz2RjpfxcToNGuBA833xDJ5luleZHDlwSXlXU45W1aC?=
 =?us-ascii?Q?kQxx2fJH/5DIjWLsqg14sAaT/koUQRWedwK6k/9dkhtjC7vyWV674LFkJVqD?=
 =?us-ascii?Q?WC5eoQTPt/d5+/FXp1PPJG87wfg8ylWf/1E36rZXb0lZMKy/KlEJxBU1iy4W?=
 =?us-ascii?Q?m0/wxzRUltxcKB7OT2TPpONz07PnuykLfyAHuyYDE7Etip5M9NYwc7y1lcBi?=
 =?us-ascii?Q?SVGH69lPNqyy6Xv81rc92EU+l9YJ8s+BS1VcMKvDR1c9gdSnSFZ81wyCSqUi?=
 =?us-ascii?Q?xkVQvn+Cz/VduOdHyqSVxBHtxGum1eE0IkNrpouMMGfh+Ztmxv20fYZ/i4EM?=
 =?us-ascii?Q?eqcHqDUQNu6Zkw3IeobvEqjyBmgB47xvfajHjGX6j6Zxd1s4ca/N/UkOoSnl?=
 =?us-ascii?Q?yT5NmjBbJLu554Rc6wNx6rAKtpIjzuF0hFTpOjDZk+ybqPBeR9ub+9zir3lB?=
 =?us-ascii?Q?00ok7M0HU2wa+Q3opfN/lEa8S4WDHKtfbLULAV7a/wfnIV7vt5BcllLwBTuc?=
 =?us-ascii?Q?3jh4qXvYYOBSUa9b4U6IyUe9XWcu09yObS3U5p7q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oIxPXJeEjzIDuNRygnIGnVxdq0QIntRtf4TOV395O71dlQiYUGh+IAJ/H6fF8FHXrHl40Lx7O2SkecAMw/v3SHSREHFYCS+OopSptyOfRED9tJSocTyh/DEQFRnRQk4+vQ/XHg8SzPQyozC36HqsgJhO8mlUp0I2VT1rS5dJqge8WjPpcFn7mynouWrS0fQyTS4+PjrjWXDprPikRL3nDDUP30gEUQxkBHjK9WWjGji7qjMiOe01sQBj5CH3NRCOcZgtaYGsRgbB/FSxyajFJVTehqa1OxonuYuERkgHiPQdeofvw0/dFVxOF4f/VU2cR3szL63DDEACdn6TAQi5iw35LpE67KK8XGekpIv3IEZf3aLlK9eilCXG7IRLXrq7lJ2fq/2XZ5/VVMF/1HTLFbiwfaerxIDfM1JDYAqcMuMLCek+Ldy0ezhE6HcmTqmVfIIGMFHLTXfPTcoIB/Vk1A4YqTHKv6WHF5QfWWuJdylzp3f7iBbeBCOQHqvf4ZtYuXlwkd+V+ubVlZuPFKwYEuo3+hp0A7KBCCrvnMwZxIBRYDBLhA3WuivD6abijrr6EiMJlCycM1coGvTnYh6gemFV6k3mdI6Z+wx/4ImI9wY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629d24d5-298c-4cf2-5215-08dc966afc27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:42.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhsIseKNdMDl4UFjQlJGur9MmiashfYkhpCpmr6t2y4/qZ0plD0Z/J9fVtQz8+/Eff3ImAHJvymJSapA4EdBRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: bJh2qzVyaqdpdoQ7Dalza2ye_bS3vx2z
X-Proofpoint-ORIG-GUID: bJh2qzVyaqdpdoQ7Dalza2ye_bS3vx2z

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_probe.c    | 2 ++
 libdtrace/dt_provider.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index d0ae63d1..48b02e11 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1354,6 +1354,8 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
 		pcp->clause = idp;
 
 	dt_list_append(&prp->clauses, pcp);
+	if (prp->prov->impl->probe_add_clause)
+		return prp->prov->impl->probe_add_clause(dtp, prp, idp);
 
 	return 0;
 }
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844c..b1b1b1b8 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -62,6 +62,9 @@ typedef struct dt_provimpl {
 	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
 			  const struct dt_probe *prp,
 			  int *argcp, dt_argdesc_t **argvp);
+	int (*probe_add_clause)(dtrace_hdl_t *dtp, /* add clause to probe */
+				struct dt_probe *prp,
+				dt_ident_t *idp);
 	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
 		       const struct dt_probe *prb);
 	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
-- 
2.18.4

