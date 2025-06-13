Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9CF1946AA
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825665; cv=fail; b=cW5y+PMQ6G6kKcbTk6Hh/44nFvDLsfgVNAq4dlP+7MvrWN/2G1lUFPeMl2bNFk3GvTYg4jfvniwSjadaZNMZd+4wapawQm2RrPI/+yhOoE63UqctbOIinoHYFXmW7giol0VlZwyN6MZx/vLF7xeGnfKDRdzG8QSWGqIGt4dRXu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825665; c=relaxed/simple;
	bh=K2sr7N23oaJWB8HrBMBIBFTuL/cxN62SLCvQ2ZucF5Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Iet8HdEsxoX5e3rvdi2mg10jGYhu04WxMjsxMpPfYKKoFcrL4YituKMmGX5FYYBMUhfvL9ysl5C9eeoUyPBASIamh2gmwB0aO6FVXt2VpCGgjkcSGMC1yBnRr3amIhW8kvXOhdmyRolUjYU1sCR1qn0rJvQ95meGBi6NKyIIC+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ls6IBoOs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eidorGNA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ls6IBoOs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eidorGNA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdEM007807
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KL5RJbjoWDO1XBwnbT
	nzrk4tl132HZ8/S2n+Hnu/piQ=; b=Ls6IBoOsfSDb9XIsrDm4dTEApwzlReFjHy
	7xqnEr3xN50OUVxGrNCRntIaTJFmhhKa1RDS/+clp+0Q9vrpgA1/08fBd+3WmkWU
	xVuumaZZ1uFszHlM3dk4gu/S2lKkRv+nKbbCjc1ZV+8zoWzp/tZKw8tQ+tmUyblA
	w/7ztezt1fHSOYT4wHzm+AXXp8WWXwDk5TBvYnO0t9y0EqHUbB8w37ej5a5dXJB1
	B0HhqYJW46dBEz29tmxeWfR6tloaONLKS65VhmJ6M7+WvQzDxa+Rc44MvnFQc2GQ
	GkjJT0uaAydkOxMsSsvpq0I+LbG755vAq8JxdPyLRxyOblNziO3Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx3sxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:41:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DE1bnL009237
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:41:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdq5he-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDFobsO/qZklRqlJAqzn8g7K1aw0d0jQlLl951BmQBLqltJdDORo+PHM+4PpZM4/oOlP3NDaICFJYQTPwrfb7vh4+g+46KmLAA6gYqA6ntkuytfCOD1F6bU2GFNHJfuqOPoLFArbfOnnX3+3yDMdotbcMGM6WW4654O6idHa3IREcfpT+D/6D7daF0KL7IgEXUmt13U675uVlPzvuqxgq6c5LSxVsky4NWoARwVdo022F1058wSJiglWfHFiMM0Yb4qqZjFjA0BMnOL+yYJ0udJ/dHu44aaueasm2AXtVa4EnILAjUE1mAbXi8GeifUuAozQ8C5dXOXCXfg8c5tvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL5RJbjoWDO1XBwnbTnzrk4tl132HZ8/S2n+Hnu/piQ=;
 b=Mg6ZPYLosCYBSH7uVKPCbHVDvLXNFr1EabLL4a/i8PjOAceX/+zkXuCUJrWrvHI7eEla3LfUUqOqahMW1I23nBpvIwlyIlU4xhHIJyiis3Xzm9FLAbKWVjChNQ5zRzJovEBLoxgRlS8FixuCp2UAMRZsPFeU/DvyerOq8ey6cYGfXm+ogRsA81F0l9XFNFcE2QEG9/32Ew3yfLEPMrk3R6z56BD22Y8Sxwlu04g768odkqoqq8gGoevb/n1FoE3o6gf/zNZLXI9EwLCOqJebT7gfJfoeaYGwCjvJunPoTTxq+jIuYi3+Ahrut2XjSDAkwkmf7Ug3vC4+VZ/6rkpj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL5RJbjoWDO1XBwnbTnzrk4tl132HZ8/S2n+Hnu/piQ=;
 b=eidorGNAWTtiJtDTIfFkfJRGum7oMkdPKf+b0c9+DBXg59rxvQGQPoSvje/GVhpyciNY9DSbKfevMeW7MZgUEjkc1Ynd/kCfkStBiDv/cvpbQuEHWLXH9imY3Pn3YmIxl9zYl0mfF0zHkdM0j1GdfTGMXrPGcTSBFwt3CCQq3Wo=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MN0PR10MB6006.namprd10.prod.outlook.com (2603:10b6:208:3ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Fri, 13 Jun
 2025 14:40:58 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:40:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 04/14] Test: caller and stackdepth tests
 for fbt provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-4-eugene.loh@oracle.com>
Emacs: the road to Hell is paved with extensibility.
Date: Fri, 13 Jun 2025 15:40:55 +0100
In-Reply-To: <20250522180118.27343-4-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:08 -0400")
Message-ID: <87cyb7d7rc.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0515.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MN0PR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 55540e2d-85f5-45f5-4378-08ddaa884fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXfa3X1sz48iYb/cIE/LcUZdc8Ktg/3dIThc3wOkDzkuyJM+Dy7NGlq2LEYX?=
 =?us-ascii?Q?QZczTRQpVqAo6UEUTLz6AS53a5B2sFdcql8CmYnLZPddLN2Tj+7QsP3hWHrm?=
 =?us-ascii?Q?07q8VP81OQ8UzQRap/hMqtrJ17js0KGBeMK682pLZ9kXAnF+JM8k5cm1XGCt?=
 =?us-ascii?Q?OrVc5KiknMHepSplrvTiqpE5lPIPX3gAEMGjhlgJnyOWO/qglXmnmg26QtNg?=
 =?us-ascii?Q?I+42vSOSB73Ci0GawJCYnvGoqT9hYgp5e0w3CZxUPk5f3WkzeuSvLvifpRYH?=
 =?us-ascii?Q?kq1C4KVA31BJRSurbTL6Iufz+D6WcutePabsNXdEolAhM8KXmVRYsZChKmxL?=
 =?us-ascii?Q?+fyBjqe5ppixIPpwsdy/Jeupp2fX0BMZhdePBCh+ENEv/l2eukoPqAVbL3Hr?=
 =?us-ascii?Q?93K97NlLdDY++m9gTzIiRbBCNDNOpi2QZBp95Od6rc+PVdm45omjYZE8tKg9?=
 =?us-ascii?Q?cGWk2gF5vHKSeDUbTFEf2NUCsWRxUVCiXdPN3bd623NTfdXGINnSS5vExmUA?=
 =?us-ascii?Q?WPaF+0Pn5YcN9uptrjbj5WhcmIhdsJKuXOOucu17QkQdskgVmA3YbSgovbsu?=
 =?us-ascii?Q?X0WORgA9P/7GF24QqIB5KBowVFtGiA5MdYo1cqTEH1C0UeU6sEAQme/tN6I2?=
 =?us-ascii?Q?CJbOcTNHFPu0bpmRaPoQxNUuXN251nHPPerpn2zgrAOHYGPAWt9QN+DLmtwT?=
 =?us-ascii?Q?DjBrP6rYA3xfrApK7M4BjGrkb3+RSrGUsbKSkHcXeFMIsOXFnVNyPeM42gyU?=
 =?us-ascii?Q?bub49Kl9aI6kfKOhe6diadD2mjnzoAVjLsI2SzEAX5eFjIioIRHP9/qW5cX1?=
 =?us-ascii?Q?AXg+aGN156SxrUEtjnN083FqaYuFSY5OdpqQUUHbPidtwDTKXlInI6ZwqWB2?=
 =?us-ascii?Q?wRfLBmGakxVny5ZH126eIVBK8eUrNS+mbDVWkhRq2hUfsGMgmb1e5RWsNs08?=
 =?us-ascii?Q?FSRyVx0mJktl1kh3hoawmZ52gJNrNb8eUasFeJEI1JLC0fOOvybwSq6UXSQr?=
 =?us-ascii?Q?YRC6dDtyQcgBnEUj5U14gNl4Wgr30upiuGtkL5TaeNPOVdmzDUWkiYik1ZdF?=
 =?us-ascii?Q?TFMh8R6OInpogEukDpzJT553WhhkRAd8KwF8dgK55Sc1lHHBLoYbtKrgYbWz?=
 =?us-ascii?Q?sGzHM0Q7fYCESgrVeacR9icmTareyI1Y33PsM0TOnOLDqv04RMUUsSzLLEMd?=
 =?us-ascii?Q?G7anRNdlEK7KjDG7TvIL9AOp1lKuhshKC9FOJmCXZU/j5BwFgIecouAI143d?=
 =?us-ascii?Q?GbCuskevvBeYvhh3nxJ7pZt6/RuTv9xTl3Emtp2lfAUU/Lsq3ug0bWcbHYCL?=
 =?us-ascii?Q?zkCY7KeKpzNcyJbTbEGH3njVZNjV+NqC3IO34++NCXVUjr90XbDJKDcVlPKe?=
 =?us-ascii?Q?twrio09lgKNJrRe5hwB0eZsmC5V2Lv6DCbyVSuNMr9VmjyM1Ap3RVvkgPlpF?=
 =?us-ascii?Q?DFP2sHoSltY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wqvQk0iPUj6tkHH4Li5QxAkxdG2bHLhGe9wYcPfD9KRIJf05hGq6/hIjxUNi?=
 =?us-ascii?Q?mRv2o6/uW6dFP9IOY09uKlS1NYhtZg12j90QVJv3iW1T+VZepLnIrV/tBCPm?=
 =?us-ascii?Q?sPrClPFXUxF4eJEbyJaeqxR705gl7rnzV1p12+A/e23tdCLpTEstT4WfM9Tg?=
 =?us-ascii?Q?c/QcDXXFxh+nZORsHAvFqVn5BQ8wZAO9ScJ2nZroQKnxpbaVw766IdYrtn53?=
 =?us-ascii?Q?RFmYDz6a7OFYYSPNS7MO8kapuH4a4HaFsAiuRdbDDPmowSO5Xm5sEx6re5Fx?=
 =?us-ascii?Q?g9SsxiwcGBho7udhyYv1uu8yiuexFF+xPZx4NjcbgHmnRATIr2oqkRKRwy6e?=
 =?us-ascii?Q?4XAj8/4HMHQSadIoOp7gWhQQPFBcZe6rOL3fG3NzbP4wd1dFzerxdNIPWZws?=
 =?us-ascii?Q?kx5rYH3QTp3CChLJcacPWi2EHixBZ959uKY5l3qUAR5piUwigC4wpoowxFeN?=
 =?us-ascii?Q?Dl2DARO6BpacsqXdSo7poucZapN+FLftD2lgwmJINvA33OrR/ygeB9FSOboj?=
 =?us-ascii?Q?UrzOwppHtp8WSHaLPNTdMfaLXc7gIbrsayMiI9C+eGFRJ/gDg+3f/zhP6A/8?=
 =?us-ascii?Q?J3fMaWgm/gnBjBcDCmFdCnxmEbJdm9bQAe9CPv0DtL8lwKma9Lk5hEvkV/dH?=
 =?us-ascii?Q?NbTRnkx5VmamWuXT6752j6ORMMVLKTGEDjIge45LnqJBdY05T3i6/0p5JzY2?=
 =?us-ascii?Q?b5H9y20Jjch91EmoPwukyIhtzcMPFDpt9lcdKTiYeuOME2JGH8dXBCdVHTpR?=
 =?us-ascii?Q?3cjR7tNGDMxdigeWLLVSpWbI1AeEcoZr70HDhVB5vCpwXyFOoOTj56XKTonL?=
 =?us-ascii?Q?S/eg23v8PJTD/FOuJ4vbumclUCXy7e/9xaZxFrZT26aZ/Tp7gFaDLAtw4nZg?=
 =?us-ascii?Q?ozFSpWN3RD8Y5e7cDMz6JFOWz6w1nRvY935T369XHjSijQpJrjyvrAhwCX3u?=
 =?us-ascii?Q?+DF8RWpzF/iKdlCTFm3eMg+3L2ffac+P1C+QlLiIk0QYndKjt5rsPPpQVSW/?=
 =?us-ascii?Q?9kEi/UvO+fdS8EubhcW1JbXD2zpZaRflBHGvITBUX5NFOp9tbZcdoXuf9ZMV?=
 =?us-ascii?Q?twqQbHRKxv5sb7wdiBmRsOsWyUYEjSFeBrYU1FutQt6G309IXlFW+Gme2aoM?=
 =?us-ascii?Q?flGof2E7cCJWEEprjvKlvGXa8F9ZvniiPfZ1MuRZ5myxExISxVJKpEcZ5Q78?=
 =?us-ascii?Q?dXof2BOyFIFyC6RnbVE81Ilx25gBuzyKuuRYNxI/LKCLi0Q6kC2/6fBYxBfd?=
 =?us-ascii?Q?aOIUoMRYVUJQZlqD2VUrxnV7fD7Uxa9y+CE0ZktzC2nMVFJunlaTG/217z1l?=
 =?us-ascii?Q?7N7oJLO3C23+XOLvfoTbN4B5bajUPJ3e/CRkvCOmOMeP5uWf0q6hmSSUKI8q?=
 =?us-ascii?Q?fySPOS1ARisMotVgD127C1m6blk6PvGlhJAKsTf+0Ui9HBSbyS4qJs3gNxKz?=
 =?us-ascii?Q?RUdzuzAQZpAAh1Rf+wnzefyLtBwEww5aCvlpbsedNuYoHSz68V0Oy+vs+jrM?=
 =?us-ascii?Q?YzOnccuHYBnKK81X8UhGNgFpjaa/WYg4WxPY1xSg0IVbdrnwPyT+g/gMTCdM?=
 =?us-ascii?Q?lFJPblbQGXXDiHniiV4/JI61y6kNcAQm5pd5UJNUfxk7GbwXcaRWHOCDA6xg?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Le/0huorjN0BgxHOum7AQRVXD9AYgjzYnSII6mWKyvol560BLm8EsJn/QTD53zXIQzrkXY6e3C0R+AhCbZI4GhXAdOMyt8FuP39WNvrhV/WZqQTQjF+0uIHor6qg7c0IuqFWn1Xt17CXLD75B8xASP6GHDHlffpZtn1ye82xfcJL7NP9O/FWcgE+q5W2+0BFrep4QK/hw40WbVMPIM3GajpMt+iW6DWxko2oFKYlRzr9LrKuezeMxBar2ClGlg6p3Q02tZ1kJqeV+AQUuylLQpzBUk/RQKiQN/uPWvmOKmKv+cfh0PaaepN1bHnWFgeStrZfd2pVeEeowuu5h087dCeO/9wUhpPSpcZBV7I6wT3GEWmFUWPfKE5Xzpp/Gsbt7IEg11bDTRswPJ5FksirwgEQTGM/QDslhOQWTnlSjbv/qS9s57tulLQxrNqE2ZLhDvInfsoCaDkX6IFkkCGjzMmc0t95iv0ASuFkQYmtl/F8mFjwYIrksXe9jnGWobAfLIbkcAdcfUm3oYfph328y0JWOfV3P5VgYjpKfGni4Xz1KvXNIW9c0ganKVZ5Ttt+rVa4z8hnIbzuoTtIuNYP+q/3+YH6EMO4bcXiorzL05k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55540e2d-85f5-45f5-4378-08ddaa884fb2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:40:58.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TPlvAsD7kqTFJbeN67k3eIM+bjfLsCAUv8CXYm7JcczHcOOaWV33DA7xLEeSaNO+r41GGFZzVph9CRZeicONw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6006
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684c387e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8TukJ0TESRpltTBLp34A:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Jq-mcpxGdGoW5fuyaV7nS6gg8qC9JGcs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX2pKr78+g46Ma HRnPJCy5yMATL7EbPJFZm2darx8t5FO453dwanLmWWOTRk2x5ioH6/icgY+7JtWZbH9iDTUC1/h rCTL2t02mdRXdSSFLfl55+sKVTuvht8/ayCOFssC/a+hIZgtL0GwGyK7kyfvekI8qopTILmjZha
 4s314+lG1jxaj6+jmlX6E/j0NGUq0FRcElxB5yS7joT+5uzkObP46U+tvGmQ3iAT0xL8bS0m3o+ 9E4reTmIrWKtC2GaORRya/keJu1D+CvAnyyk6nyKf4OOZYFQ+6ACMY2HSD6nF6e/APZqxcPopkG qI1sza8t1lh7K1bSR/O2c3QrWhiuacMnDA1AXvC1wAeEiCqNcbYJwkpE4y9uHQAaoAdWnzyuXK7
 HI1ms1FgOlD55w0St1gMeSgyl1AdbD5vZaaRe8sP9HdEyCXIak0cWDvvPnZDdGNJGcpXJu06
X-Proofpoint-GUID: Jq-mcpxGdGoW5fuyaV7nS6gg8qC9JGcs

On 22 May 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> We will introduce a set of tests for the caller and stackdepth
> built-in variables for a wide selection of providers.
>
> For the caller test, we will essentially call
>         stack(2);
>         sym(caller);
> and then compare the caller to the second stack frame using
> the new script check_caller_to_stack2.awk.
>
> For the stackdepth test, we will essentially call
>         printf("%d\n", stackdepth);
>         stack();
> and then compare the stackdepth to the reported frames using
> the new script check_stackdepth_to_stack.awk.
>
> In this patch, introduce tests for the fbt provider, along with
> the support scripts they need.  Subsequent patches will handle
> other providers.
>
> The old tst.caller2.d and tst.stackdepth2.d, which tested fbt,
> become obsolete.  Remove them.

Nice! My only caveat (easily fixed) is that the old tests had header
comments saying what they were testing, while the new ones don't.
(Yes, the awk scripts do make it clearer, but still...)

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
