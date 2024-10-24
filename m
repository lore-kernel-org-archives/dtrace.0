Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A71CFEA9
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769922; cv=fail; b=uMo4qyfEeTq8hWFSUv6KPBBfxA6El02bTlbVtEtxI29dRFOPXYtW5N+1TtbYhQ9V2qtVbTdUnxtyl9jtHZEJme3FKPw2hpD+PYRcOmHqRuPh0LYTgTWajWiqJ4g7uK7iG0+lvu8of4FK0jbnr5hG/YKBKnYLDv0zJIX7vSBDOD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769922; c=relaxed/simple;
	bh=qiDhtALWYDyaridaE9FriRmDIt1uXMwuf2JY4Zh6jfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F3zmfKqg+JrOfAb6HR0ZVOsZhKwv1+fxkEs3nkPyOALqCL9loFnfi1FhH4kp2Mztl376kS9P+nYqprF77zbuJ0pEF4YCaXFW3KubXKs7WZ/bJFJEl9OQnzTM/5oXT71BERyp7MNaIJI6hQFDlIL0wYD0bfMawNXePF/Tuf2SdXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RkB2siOF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rxsoWPbY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RkB2siOF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rxsoWPbY"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fvDT029924;
	Thu, 24 Oct 2024 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ofOYOuBzRQIT3e5/fy+M5SYUaATBPrIlrKbN64uBw/o=; b=
	RkB2siOFhbydYKQ/aphITz0r1dwVD94Cr1d0OuulJ9jghWpV/pEf1N0anSspZDHQ
	IYm9GKBYiZP8iikv3z1Cpb+i2BBVlwmSP+VIjiq98BT7IcBdKw88PHXJXSF5T7Pi
	sfch1nnystYVne6J0QpILPSAjs2JSvwgzsIUrTOqkXA+wJhlgr+ZWXf59Tu9+0wn
	OmgCNfO7X1ZiUVyw9G267dO+yNoSwE11GkIA0qusWUwZk0OiQmgwGg0qcUHl/XQ8
	tgQ0H6ShDoATF+MmGHv4ETPJdGQdsgWNibJ9Ni/V5TcCCPPHn96IaAPJj/V7Wfr5
	BNLOLAZfPGAXEgeReOn0sg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjc0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OB8t8M030951;
	Thu, 24 Oct 2024 11:38:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2tbb2-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItotSQrHLMQoyg88cvtt8NRImstzwwBOz5j4wuspjqUw5yTN/6PmYGGtAh1MTNIdKYunybII/92Zz98KGqEh3+uen4PuMeNqtIokTdkb2tr2rWKZ1eVDpedlNvamFqrX3kiVnRySeJOFAAfvia7qvkOxwfxt2Cqruu2FKmCtGrm6YdBc0OgO3u0Xjl+f/6bIqJ/iU5NsXdb8FXejFKaDOfHvPW/0FqpHp9uR+rQ5b8DcUuDQTGR2Jr1W3zr6m5TZpwtRTTt6k/zTQR4+ozsqt65jBCcc4tYF46o/ME5Tp27gcbQuW3bHZUxQJqUjCD8UEnt7eBWGSpXYq6oPh0hkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofOYOuBzRQIT3e5/fy+M5SYUaATBPrIlrKbN64uBw/o=;
 b=ALJ0xmYkbK8QWX76ETJtxq40Pm7+ey/RRvK5Ugx9/8HQmiSc+KHR2ObolI4VSIt11tp9ZcLtnIuIMIGHYUAh6fAQT+6htTZM+BNJuhmHrcJvWzpnxJpqsQFM/xorKAzSCKSKDcUINqG3zvbn1+HyIAQQP0fM/QqzFteapNoPjv10HfVtAB965JuQr+dpdDMTfO5bTKw5MjrX3+Py5BE7w459i+keYEAFRMcVt+TLIe5Lce/23OiQGu2RgbqVarRGp8dLYXS5mvPkEqlASLeWyejFgQogaFHVrpatfzDt9rtPdjUR0pnafGfo5sL0TQ4+IBG/ipfkK5G6F8Uc176HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofOYOuBzRQIT3e5/fy+M5SYUaATBPrIlrKbN64uBw/o=;
 b=rxsoWPbYcinBVqr/t3voaCNEUKze1+zK9tXEsiQcxDh4f1dhH47n18v51SY2oT6KXn3FullLgfwH41HII5Sp8UyRqM/p3V0G6MfJ26w+mp5Thn45Ps8Cti/tGvICwpVZwVpI/HAeokvhihJgulK90WDz64YHWERQzM4DzS0I47w=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:23 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 11/14] dtprobed: fix parser child timeout
Date: Thu, 24 Oct 2024 12:37:55 +0100
Message-ID: <20241024113758.182050-12-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::25)
 To MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 957ab978-51a8-4409-ec8c-08dcf4205e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QuNPV//aGD9Qm1EKO97o5NW/X7JOWu3bt8d3phq91UfMDMP7rH0OWagorCNp?=
 =?us-ascii?Q?U0eLde9+DgRE/ndi9Jg6zRaXJcVWAP5KfxPyLhx6I13HdVoEqB9eTagwy76Y?=
 =?us-ascii?Q?Dzgqzue0STwwEs351ci8IqaEVZU13w2rqLIRgvO67ajottPnwa+oNQ4OYqzx?=
 =?us-ascii?Q?knNgkYhWiClWboUviXm8tIeATzaURnPXxHPIH1FYNZtPWDbUI8h8piXUibEH?=
 =?us-ascii?Q?awjDHeCd8eSFQJTQU4S012ImYJ/g+kk0/T2+KsGDRLnyRPThCxGRN/bRA1sw?=
 =?us-ascii?Q?lAu9PpVutNXTlUM0T/kVtrcRlcwz/dFumUuXGQEK0mEWVAbrbYVi8bor1dG7?=
 =?us-ascii?Q?oZ3irACA4Re5NGwkkn6X0yvUO92YkNjSngC3YF8HwJqVGJzJ2jhDsh/8chrG?=
 =?us-ascii?Q?dlJtMYCC6z6XpMxJHlqlnLdiJyRyaKGLN++qhgk3aiEIX1pZ/vw9jlEDbDm6?=
 =?us-ascii?Q?FCQgRI6we98llbQsu1cUUrj/KCcLxb5411IvHxjSVfThFfBFXqbbWppW8Liq?=
 =?us-ascii?Q?snYY96NbNmntN+zZH34qy2LdiNNk/yWMexBiy9lrD37TcUXIUQKRobqSbbDA?=
 =?us-ascii?Q?gxE36Z1CR5wrxK3rIM/u7jbNXAZQVqCa7v47QWpiVPLr5TBBoBqnD/jNRqkV?=
 =?us-ascii?Q?28O9cIpqCNM6RKMNsRtyAn4AXngjvq7aoiGzjEhJT34sqQIdUHgpTi9JOGf1?=
 =?us-ascii?Q?mqAlVBfj6LddVxsMh6Wjv7GWRU9ruced8IelHghuA9y8QpTpV+odSgYXxqnR?=
 =?us-ascii?Q?brKqpu5TRFb9u2IoYckGGGx3mrMvlC/dCIHlnfq1NdEqWL+fcDnBoZpxMEs+?=
 =?us-ascii?Q?YmhIsSjEaelbWScGAP1EuhyqK73y/F5RWc1GC3/1QkMuivAxaD0rtBSpzhG4?=
 =?us-ascii?Q?TJchO29d2/f9hearo0qCvBTVmlgv6JcF6ceq07Dr10Dxafz3rZ5Vip4YdK3b?=
 =?us-ascii?Q?SKnGaGuqROBZn6PtTHG1lMIeed4gFjSIUcY+WYuKOJaPYP5Lbay2r23+TaiR?=
 =?us-ascii?Q?oHEEP1BAX52YPSLd2rcz/YM+mLpRsoHcpZ5xV4zMMVBe2nMqpla0Vy0EmgZM?=
 =?us-ascii?Q?mFHgaaS8DGdIhWXqoukvrrwgv7r9cgo4zPmMCjAtv3yQhn1bxpCWJD+ZuGr2?=
 =?us-ascii?Q?+sJs0dqnUTMoKVmdd8vrdSz8zSFgDszL24rkOjdJRsd3WcccM8ceU/oLOxy5?=
 =?us-ascii?Q?/olaodjhev+vgI0QHeU7sSk0t4I3TaU8QwuUi17LgW0A1XCp+GgvtUaeq4Zw?=
 =?us-ascii?Q?Ox9ETT3S2Cy9tYBeTHG82XVodxV76jEeAuZSizXKySydh4/yxWbGAYw+Oxw+?=
 =?us-ascii?Q?ex4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edUbGM32seq4bqUtnSlwFDQfs5xg2TDJLs4Djy5wzmTIj4lL2zrMVHuM98hD?=
 =?us-ascii?Q?WyHasonWWysVBWhopykR2+QUMJ6heEl6JuMaoxyrWdPvXstrrhXKjPkxoyMV?=
 =?us-ascii?Q?2Ys4JUkqkzQeB2Pr5TOsfHuYwR7lQA+lOig7VaCMu/wGZrO75hQVOeN6aJMw?=
 =?us-ascii?Q?b/br5l1Jbkl4ZChUefDoScAaHFn9AEEDmOpqOK6QjwJy2RbgAK8IIDeSeo9F?=
 =?us-ascii?Q?tQCe1GPl8n37/okQ/ps3MOvqCAbTyiGzTJMCfvDa23cT/ntQeIjKbiGer9+e?=
 =?us-ascii?Q?a6rcPw9HKiW+T5zqt8wu527FuHANcquwJ9DuUl6e1V/qeKHJ3paR4wLbc4hZ?=
 =?us-ascii?Q?GCpapdcEcWVycqn7wp5cl6VMNTIeOH/JjFFD2SYkmlUXL1X7dxrcIxVGm0yP?=
 =?us-ascii?Q?O4rstGBuPhmfubrSanU6Tcu6qiXc7HaohUawmBFm9GDjPUrIqCFlm9kYT1HR?=
 =?us-ascii?Q?bZL4wxBsWdjCtujRj1MUo6WjaByI0NNGLavt//E8yDObNF+BxLfeL3S9mWzZ?=
 =?us-ascii?Q?s0/s+qE9ny/yxlzn1AFV/iAozkQqmYmRMeVt6IjQQFxA3lWOmRhOPvTMkL2r?=
 =?us-ascii?Q?Sht1bS8t2hxXVHSie6x7V3k3YXg9YE/6dd9fBDiYUoK9Qz2bId5maAp0YyW/?=
 =?us-ascii?Q?q5kgJhUFhVwBqyVqaf73cnZGdi481eV4Ov7/euDKvTa+qdq6f2aQ1CT3e0Ew?=
 =?us-ascii?Q?DJ82WANBG3lzOAvLf7ZOC+oulviLjeCFYJYiogt5hlIb2Vdqy75IXNTjpJKU?=
 =?us-ascii?Q?/fUsrOHJGbxnAmgoSDZktIlzMfpEP1n8GpOt3BLzmCJ6IS+hdfsCjCOIvX2N?=
 =?us-ascii?Q?3UIxvWqKnBr/D7pXhqtsZ2jhRf/cuvGGbkF1R7SAoqfp1S4v550KorwQEr/m?=
 =?us-ascii?Q?YFYXTBduEqH+CoaMnKqNP8ddaoVrXcr6pXsRaE3aCcltrMbyrhEatjLz5hJm?=
 =?us-ascii?Q?tTYY9yyiW/gOYTRbVHstH/ABkTyhSNdynLhQsoV1Ma9zz7tmt5NKm4gXQgBt?=
 =?us-ascii?Q?rVTInfqMe+xp3/iEL5a04t8ccR3QLDAzNZTH7v9f7Z07OsD+NZ6nxCspSo1s?=
 =?us-ascii?Q?mwtfuhEfMDJP0WsXoxyZgDuCUaSaIMVxUoyACWzn5WLS6VYRYmPyymdSKm0+?=
 =?us-ascii?Q?FSFoqzfgc85dM+4yst2jc358pVHCJcY73nIxVZBkpVq67mVsKO8FfOyOF1na?=
 =?us-ascii?Q?4UJleF0AvBaNt7GLEh3OJDTLDxaQjNsUtGoC4wTJ3ESaXKtl1kFNB084a4N4?=
 =?us-ascii?Q?2r6TGwjpYyKOG7pQ6l5FUlqDzaUcUGouxeX5cWzyHVTb0pT2rKD2IrrieiAS?=
 =?us-ascii?Q?Hv2Q5i3M4ZUZWu/bCcVoNq74z7bRM1mqhC/DsIf0q5TBEaWXo9CTEJBYPN6b?=
 =?us-ascii?Q?s2Q3H2DFzWmf3U0wKSPkr5+mzboziHqMu58xBdAyRDDKq9KcA5YiQPiuIkhP?=
 =?us-ascii?Q?Fxbfp/hgBHnglgts2bJEAqIfbwT3YUHVEARXY5xkRU5sGJb1HzfeDvm1zFuc?=
 =?us-ascii?Q?fLsDSRBF3j3uIi538bjRobOcBYrSBJsR/ZSL0aRJozl4p+ASW6TeAhLKvc5t?=
 =?us-ascii?Q?aVZcj3dLy5XgThkYJm6yAIURyvNGKlU5sgWfpt9+z+x0d9I2PM6GxWeq+F+y?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hbNZS1YBO7jb18RYvNdGlldzC2+u+SXfUrl3OsxIBVHpdBf1v9U2FaQMkVWAt0nulcpGy0zSrimHmtO4FHVXQ4EwQAJEQPTi6hAp/w3zkDMpYvzA46GAZ1xYAE2PQefnyyfD8I68MaH7UzKE0SN5YGhC0FjD7vXuvFQ7b2se0Amx2R7IPXrAw2Uir9jG91m15ZuVid2D2pgRQkd6ZRdtHErrBW6pQ9p6YgZedIlqKt/XZq3iTyIdttxZLhE2IG9pDHYwvBBaQv/jwXKRP9Ik8R2HeArZLp1JQ4Cvsv6eftIUPtKs0OmAIryLVTFTh3EVvFq6yqIns4bRhd64XCXn3o9qHdBpYoom1qCB7C3S+h6/9p5Am9m+7U/RqJqXzQE/cZ+EopkdXPSEzg0RxUrxWIqO0jW4gLyjcR7TKyY+JqDhorC6KR9fdQdvESEzEetVffcCWfQNKWCf1HuEeP3pcLYvpKy9pnBXJeWZzQKBzTfWwJN2j9uoyR9dodxxCCd2UnHO9SWAMHhipLZXEJkHuNc+41uAT7nlt+2KoKj2A1tAeU3twNWzDNVMVbcooLkl0DL9d+vXaGZsTHfCcZGWFRXCqAJ6bEkXDiY0kxTKEyg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957ab978-51a8-4409-ec8c-08dcf4205e34
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:23.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKy3VHVN3r2ohwr2fjNnalQhuZW2n2g18vLVqqbic66ueU69DTHfpWIJPHUvSf9UEnn8WdnC8YJufFk2ToLXxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: XRmiVvot8g98WRhO8C0g_NRZj_2qr36R
X-Proofpoint-ORIG-GUID: XRmiVvot8g98WRhO8C0g_NRZj_2qr36R

This was always meant to be five seconds, but when the option was
rejigged to take seconds rather than milliseconds, the default was
not changed, leading to a ridiculously huge multi-hour default
timeout.  We definitely don't want the parser child hanging for
nearly two hours: go back to seconds again.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index c83f0adb56c4..f4c6be1e045d 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -82,7 +82,7 @@ static pid_t parser_pid;
 static int parser_in_pipe;
 static int parser_out_pipe;
 static int sync_fd = -1;
-static int timeout = 5000; 			/* In seconds.  */
+static int timeout = 5; 			/* In seconds.  */
 static int rq_count = 0;
 static int cleanup_interval = 128;		/* In requests.  */
 
-- 
2.46.0.278.g36e3a12567

