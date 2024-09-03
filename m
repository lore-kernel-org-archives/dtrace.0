Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258F1C9DC1
	for <dtrace@lists.linux.dev>; Tue,  3 Sep 2024 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725394226; cv=fail; b=r/Y4zqetAjT9hYaG9lFfJmecc3T+kXz0ZIov47R5ZTOrgUFC/GKY/D5XjpzvBBIYWmYEn8iWpKlq0aKGZAkKgmUPKkjXPWyv9L/Hl+ZLhRu8MRW8HU4OjJkBwk+T/UbQxJ3uWACmb8WcHCwglZnkuN+pJBA5W9C8tS+hJiDRRws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725394226; c=relaxed/simple;
	bh=vIbSg0HXW15vkrKWaDXYtxhURSWsxYNh7ejD63jCJho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HkwR8f2QobxNi2Y8OAOrH//7KlHjmuse4NnpbsMzF5B3dLiZIQYvEK04CQOIIkLnr5jCp9z8dee6eSDuNr512lqtcocqBjc79sKuTPwa1SjcmPd6Z9pQndadjcWxhhPnE0TrwMXAU7ss3F5jP5endthbHwHDPOELhhgUYMX8hLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QujrTHAK; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fb6E7EuH reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QujrTHAK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fb6E7EuH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483K4fnM015968;
	Tue, 3 Sep 2024 20:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=3aS/Vxjfq32DhtFTZfqcSJFNz0kUhxGSNZ57yB8Luvg=; b=
	QujrTHAKSla7fkeQR15wLYMWDSZWNaJ1UNS49JpUzSxlOGzVHKo6B0tIwZNPGQCf
	45aWhCrqblzJpOFeHrPFMPGKsLIK4+0vTW/vuBgyCVruF+JSgCAy5Si5Ly7RvrYk
	cgzqplUdRySwlcN6Gv2y+f4vhgttXTD4vy4BEGTmiDK8K6qSD9nt/s7NowuDntS3
	/uErLuDx7TUeDADAo8aoCeehQXO0kupqe1YX2phrU/it9HpgYpYvfweDbmFxOU/o
	CBHfpm5STibXu5zK/eA6h3QHERW5ruKamC//HPJuKCtTW8AxbFm+Bn4jTxfXtOnS
	XmUFII6xgi222p14WkMEJA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84jjdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 20:10:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483JE7uT037355;
	Tue, 3 Sep 2024 20:10:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm96c16-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 20:10:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjypEA1wIA06OM04nryaO0aObYVea2omY+/Md3rIPLdjfnG5+sByrDcwzN0DiZNHGU20+PgqdljSKB11MAkelq8OViOe4Vll3W9DqpB1E7T0mBZRz7kq9hbNCbhgCAEUPnn1dKWAQ7+O8d077WtkAyLL2eIGHv1y9FTrLFgI1v+2Qjh2QY0U3wfRYg/oy/s7VQUyj2lWyZoWRp2I/Aaxf41ZxR7RtUei3Hl84sndvWQtrmIOu7MjrR4UdvX4ZiwquOkleYFb3FKxLgdJD1MlmgODeBa0C6ZxFH78d9PYDkw4U5qfZGScB2Skaxcp3EudZJx94bDWdGC6YiSQNgNTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCjU3JgY7gLXm55atcaSKZqRwrn5b6Nrft/aFcVu/fk=;
 b=KMsw3HSbh1uLBzvbSVGFlqEuAHtyCtUdH7bwW78h43rU6NlGuFNV5xL19sH5NTQidDN2OrbJs9RH5+0GnaLLYwA7wcH/wMBoVDOg+9n8ofLDB394QEhKkce4hfWyYx4MyNgwI62lu3sd05t2XFAWIuKlHgDLBk/paQOrES8jUPK0EvAYly3UMW9KY/a/YpQmsHf1VUK8pzq5A8zHoofySoFMRE9P5gaLmqF/5o559O9fL+Bvz8EoRpnhzNWaQQ+YLxpeR430f0JXUP7ucD64kI9Vkxc+p4a6Rmr64woh1NnH4lp5Edp/BfypGRMOOTOM5G51AJ7bBXbeSIR6zo0AVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCjU3JgY7gLXm55atcaSKZqRwrn5b6Nrft/aFcVu/fk=;
 b=Fb6E7EuHMXh7HV8PZFJdY6gonPOw4lcxGij5YHrb0akBNF1rLokRLUssdxjNPF2ctodCSfEbWfljcQRb0Bwwj/1r5Z7l+8ud5HEsIZ6LHpJ3TsYraag/jI77anHdCHUez25Fufw33difYKhJO40xZMiA2qNfuqaHqx5a6qT/a1s=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 3 Sep
 2024 20:10:11 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Tue, 3 Sep 2024
 20:10:11 +0000
Date: Tue, 3 Sep 2024 16:10:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Sam James <sam@gentoo.org>,
        "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 15/19] Ignore clauses: some clauses are
 impossible regardless of uprp
Message-ID: <ZtdtIbTUX8BhY9tA@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-15-eugene.loh@oracle.com>
 <87ikvjf4ua.fsf@gentoo.org>
 <624d5187-cc30-e5dd-d7d0-e7e6aba2a3e8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <624d5187-cc30-e5dd-d7d0-e7e6aba2a3e8@oracle.com>
X-ClientProxiedBy: BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9f6282-b7f3-4b99-4f8d-08dccc546a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?5z/5v8VFNDb8/NeFrejXiSnBg1ItN6ndso/bx3fjrMKarB73rA3Qruy082?=
 =?iso-8859-1?Q?VtPA7YWWbL5ovqp9aSrAUGsa4KtLjzGpqThmEYy3EXEvdcEHnsAbpyDAQk?=
 =?iso-8859-1?Q?z6K0CEk6C2Ke+gwEWrQQPORxcJvvex7ysYTQ12l8AqWa2uKgx94r84BpYu?=
 =?iso-8859-1?Q?hR4kKz6nbHBCVU7PAUqJ3oRslqr6vmFyRDfq6Oi5N8xmqND+NKbVewsz8o?=
 =?iso-8859-1?Q?Anu8i0i53pYMRqMsg0FhEUhTaRbrFTjBt0GgwWEZqecfo0oLQU1mj6Ueic?=
 =?iso-8859-1?Q?Kwqk2naUYHVDdRGJzcGT3+ReE8dYTfJulTwBaWuxD3PvLIV2vTAgZqZgo3?=
 =?iso-8859-1?Q?pkQTo5pWwoq2fnE6RVmlFJokKyNXiSI5kB1dO2ky+zembTa2BksJIdQSAz?=
 =?iso-8859-1?Q?T+fSdEf9PlrzVxtdfvu0dG2ucJpcm7S139ej0tgliqwzz4CNsDr2+NjiA4?=
 =?iso-8859-1?Q?uLu0bGI3u+wlSwXrJp1EhkvHJ4Ko2GEJTpMb5Z4Xq0hy6HppkUkY1YN9XV?=
 =?iso-8859-1?Q?ipewGjvj1bSQZpVSHcKsMPmBBXLlSR1idGzRd25BIVVn0L+YiPWn0dSmXw?=
 =?iso-8859-1?Q?8KhxwV0xPBesKuvQPdBB0kKV6DRh2J+47HzK5fpyDplfRh8qieJ4ya2eE5?=
 =?iso-8859-1?Q?LNSV7a47zr201V9LGild6mZS9R/gz3GfoekXNUIHAMDPs67FPlfxJN7p4j?=
 =?iso-8859-1?Q?9t/4QcNQ2j7hWJnkRJC2H8xsYOxogPbdAHC/fp6oYiWSXfiWEEDJxCOaRC?=
 =?iso-8859-1?Q?3Hi0bPnT7EZHosQ73Jn5kfxLwrwJLA0B3dQXQeAzFicNyn2osjDSY6Pbqu?=
 =?iso-8859-1?Q?vyNR9FQWPWRIGeW0TEBdr2Nvg2TQyclY8RyioK239ltDjjjej4Sw3vOmIa?=
 =?iso-8859-1?Q?XEdHX/gWUnyN6DATnbL0NmuNra8CGgxg23NaSUXBF5lAzFbR4AUyv7VBEG?=
 =?iso-8859-1?Q?/hkoqZkf403DNWuotTuD4/TdvxHKwjVuK18V9Iy7KQTF2UaOOtwjnaUwlL?=
 =?iso-8859-1?Q?cSoYWU3obOUThP+re3tfcMYnRH2+KPIFlZQhVcpTrUSKeUbHG9bHfmJ9U5?=
 =?iso-8859-1?Q?HTy2edlDq/RtfwHmjCtaNHSQ9TP6dB7TOt95V9u9ivS1JFfKbNFjVKH2N2?=
 =?iso-8859-1?Q?69Y/Z/fd7lIkpPBjpd1ORAqPlltwkoJHY4EYiozotTQErPZnjCQIp7aCDD?=
 =?iso-8859-1?Q?YRBRDY5hOLTZ0kGPuTCirvldjdXO5mW+EC2NbupOi9umolt4CdR6F96OVn?=
 =?iso-8859-1?Q?AY18czD8zVXEElIuilhouEc/AhbuRyZIiVl6U5UUp0UhZnC/YxFdSNt8NO?=
 =?iso-8859-1?Q?c9eBH7ypJNu3rhyUSva3/OujTEcpHxUnLBf47moE3NHkjzU8hiH3Jc8sAX?=
 =?iso-8859-1?Q?pBem41ifcO1F44jqsri+u1ka8AolnvPJCxPD/eWfNAW1dfGtb950w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ba3R5rTX7dJST6JFq5JFrSWBEpd0erIUn4Hfow1lWCfzgjjwyqTSkLlyW9?=
 =?iso-8859-1?Q?y6mpYhEBhShj9UmHCwlpSo0WuLBJmg2qCST7R3ffYIQUXsohtZDLjT4Fa7?=
 =?iso-8859-1?Q?GoIWG+V6NgtP7bCY/geZ9slAwaz9eCVSBUnkrNMBybqfqlIfuIpZCpi/WU?=
 =?iso-8859-1?Q?4ngolYJJeAPA4K8gjOfP+YBsQlVmiyps70vrxVuBIg600Yf7MMMpX++NPV?=
 =?iso-8859-1?Q?6AXZvN1YnUDtOipViBTEj5/3FxwyMJXxbh5jGVYKHtO8nnPnmK/X5juYJl?=
 =?iso-8859-1?Q?cRc/2PLnD5U46xSoIQF28w4U18DZmM7PmRMF9GNQEKuQMPu5FroT/ZCEK/?=
 =?iso-8859-1?Q?bLMUSHxHxd0OJuxVcZgZRv5LRNdqZinOIN7BjQJQWOh9VoM9otjdvyut3v?=
 =?iso-8859-1?Q?K/sJdabY9ZbmGoSPjrsT8vCrberXuL5v7Ru3lljUZb8FaL3/F5rG21lqo+?=
 =?iso-8859-1?Q?8l4fogGxIFC6RmenZ3OqTS56LgCuMuO+zusOJq9wfm8uBxSqjEz9xCTTUK?=
 =?iso-8859-1?Q?J5zrAs1MH6z8FMmrMeeZ4IjnKef6Hr/+MDxBxwpHkkFK+nLQww1I13tOR+?=
 =?iso-8859-1?Q?4Vno0dIvmHgTtOvGH/EU92D4nAV06Rs4RenMH4sHgwMKx8C9G71rNPkTKm?=
 =?iso-8859-1?Q?X4nPenupbMqWELfoUBcvikHjdkfAIasrzyXMsUYo823oT+9lf8f0n+RL1p?=
 =?iso-8859-1?Q?9Ifc5f4uGg7a3OYUfJXLvrckn8l8VPh0dxnnfD9k2Gic1AM4vamOKausQa?=
 =?iso-8859-1?Q?kaFlA+OG7YUIYWbZ8aiuqium9VLHHHe1Rp66krgYjIxTClvYAJ0Mjth4lB?=
 =?iso-8859-1?Q?ZXB749DHEemxE0QqTIayG7MLyMdb7yVx+YmbYpP3EY+0uKRSaRGJZ4L06h?=
 =?iso-8859-1?Q?sKbiWvuGo7E4wgkwYNXqk0cl17p3kDWF0yVEv3thpymt+Cw9pnXJbYRPpz?=
 =?iso-8859-1?Q?D88XEEwi/7B6fFvML7j5Iuwgvrj4tt63bsD7YOXhatPI5XqH1zY/PO2tMP?=
 =?iso-8859-1?Q?vKEsgMazHiEb88Q5cmWH/dLhNyJ27ftAiRfztE2drMP9hljhxW07Y3RyF0?=
 =?iso-8859-1?Q?FtUEH0mwKRbbHdbP9v7cYSd17/5A38vSn6boCM/FEU+cL4geQiCqius6FV?=
 =?iso-8859-1?Q?p/fMSx0pPVIao4xSQg1Wb9kx2gG6y26UU7I96XpS1vPX0Iqn5iXUJccd3U?=
 =?iso-8859-1?Q?MIq9wBCpPpkjdSQEzkd6OVNfQXK2Wh3Xe943MKAGaZ/VNWO1BjbdP51eXq?=
 =?iso-8859-1?Q?suvym4h0qmsacOzfOasgZ5sF9d/1NknD9Dazp7xCAvdqxFDD1oSo2hTuPH?=
 =?iso-8859-1?Q?CCm7t9TyNcbLFbg/Jg5t/ImOnjVhmvbLSs8rz6nwk/w7/4yKq03r3eoRn5?=
 =?iso-8859-1?Q?17Ch3tIniLhpI0oxV9/ZEfWRDnIJuHiF8XcOLGEsuVfoQA3zlC1Jz7JAZK?=
 =?iso-8859-1?Q?l4wWqNuhTMnHHaSJjjKQv8GbiuM19W8teKYhgHf2Iqm0n+/h4cXENGLMHj?=
 =?iso-8859-1?Q?K1q4c2ehB6HhdV7GZJ1SWzUmJqmf6CtRtFMMGyERZwpo2cJMBOiQxkcu5K?=
 =?iso-8859-1?Q?k0ZGHaQdI/1XjtWgPx7DARvB9FM4cX4mmFA7g9Hrn56Mi22RjqxrgTxLuz?=
 =?iso-8859-1?Q?0kiGm/2/2g9BUfzOOy6V1sA+5HgC3qG8LW7ctdi4SNY7chrBID85j5MA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MvxOHWY/YZaFXVvcB56kQxmNe5RhNEoM55zwnHHKLPW+brPYsD2ybaSWYxh1kFyb8fvmFMW/imFZCpDxlbmZ2CGVxUFKDiOPaQozhvMtIK+wrSoD+JbMyKkYDbzp42d4HqZisQoPZmYPN893Te0TFuJcE/OJ+DEH4ED/ssOEeXJ6erLdQRoEPCN6lz6iyRglqFZZRvoPEdgQlne5wJ2jGRhzQgdZoUjIuDxB3J7AwzOmgAOzMgOdfReuAAfcnCAlNTpSsAmgsZcD5iHNWXF4yR6u7FSCWSaenuMcLCx1J2McUN+xHXIR8JTo8+w36xMATf7J+YCETiIMalV5kke+frtEbegoObBTXL+MMiao4OO0XnlIgwSV2kCopOvW/0uwsw5XhKWzPiKSA3+3PCaYPh2++rDb7KMEwl49ne6SMuc1/iS49J7bNeWSPV480tUUkpmRVCkHkc9I7iV3HrBoPSa4kzAX2YSUlLodQ/5D08n+q4vyXlnfSfu5+8bIoT8gA1g4LNi9eM/zhnBo3381zbaFzo9wxEZ3ShMi9Nb/JTJW8PNwSKnkYIAxF8+Oesp73S+MyhQpqNuJe6RWaT7vguxWvcAgwdBy35y/RhNZXYg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9f6282-b7f3-4b99-4f8d-08dccc546a85
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 20:10:11.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rudl4VDOVAIGoILzFx9V6Kd6W8rsxf1HEMW1hIS7mHXkXjYhDVkEBOprH5xuUG5VAjNBt58Pppl8guVzdiPmMgWKzQDLDpgHPV0C/YHQ6TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_08,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030162
X-Proofpoint-GUID: FD0vZVKahQy3P7BB1jqqKxvrfqK45uX1
X-Proofpoint-ORIG-GUID: FD0vZVKahQy3P7BB1jqqKxvrfqK45uX1

On Tue, Sep 03, 2024 at 03:54:00PM -0400, Eugene Loh via DTrace-devel wrote:
> On 8/29/24 16:31, Sam James wrote:
> 
> > "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:
> > 
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > Not that it really matters here, but I wonder why not an enum?
> 
> Yeah, good question.  No particular good answer, I suppose.  If someone
> wants it, I suppose I can revise the patch.  I would say that this would not
> be the most striking use of #define for enumerating values.  E.g.,
> DIF_SUBR_*, DOF_SECT_*, DTRACEFLT_*, DTRACEOPT_*, DTRACE_STABILITY_*,
> DTRACE_CLASS_*, DTRACE_CONST_*, DT_IDENT_*, DT_LINK_*, DT_PRAGMA_*,
> DTRACE_CONSUME_*, DTRACE_STATUS_*, DTRACE_TRACEMEM_*, DTRACE_AGGWALK_*, and
> DTRACE_OBJ_*.  All give symbolic names to sequences of integers using
> #define.  There is strong precedence for the practice.

I'd say that is merely because that is what the original developers of DTrace
used.  We certainly do not need to follow their practice.  But either way, I
don't have a real preference here.

Further review comments on this patch to come (soonish).

> > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > @@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
> > > +#define USDT_FLAG_UNINITIALIZED	0
> > > +#define USDT_FLAG_POSSIBLE	1
> > > +#define USDT_FLAG_IGNORE	2
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
