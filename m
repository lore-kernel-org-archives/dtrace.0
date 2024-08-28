Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A245C1C
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879784; cv=fail; b=fbqyg75ypr3pPabB+7anJfs83YFOjUyNUYDoNxUdZd03u3mc1nQ2/ZPkL0mM9By3/HTYYvR68nWe8o7sdBnKnGEGoau2uQ7tZEbkSC/YCPGwdmd8MyzMS5gmGb45d/QDjW1yTjYe3PI54kQtynmWVrq4KinecV8ssD6QhGs544k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879784; c=relaxed/simple;
	bh=jFrjOMOF0KUn0dUGGj8W4/u1yTXAM+pWZq4bozv2u/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mi8LVPV1s73cTLcIEgUFFTNdDLS3zhLGnljlirpl7D/Eg+riAudSabP6HTvCM+euTt6zo/j1BJqNIy6uPAHiOzmuwu2cM104oUt/9VtaDCKQ28BPQqv7j96Wku+xN+dvmIbonXQZjkqstC/gGAHlSqDQcbQngEjNPc7qnUAiWPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BsPVFFuq; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XLP8+6Pa reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BsPVFFuq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XLP8+6Pa"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SKipr3003988
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=Xq8iiYFkIsDI2bKXjMnA72QYipR35LrYw030w8oAIn0=; b=
	BsPVFFuq2gb+dR+MVVab7n8Ds/Nz7GOyaG2hKhEiPy16+2f9Y8o8QVtUkAp1J11a
	Q95qexsTECwAf8fe/ItRk+aAstPPzDxKYCASiwDUl/z02B1q5hToSuXawSxxPgsz
	G1pXbwF/qFVYc8ahLKJes+gxVITUQYUEXIp1+sFnjqu/hnkXh+haK/cgTOenvafW
	15QQcczP4dQC6/UBwlIXyvSSXoKQ+E0V6dY+i5gs8hC7gWBKcISfHjoAg8YAeNIK
	Y2kFzUIerqury6AhGhR04hLZ9JEG5fjk6ljuVWX9X+zTOUB9+MPfxXSp3zySOGoN
	jxfwSOWp0lpNgCXmXA8DQg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukj9m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:16:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SK3jPI020231
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:16:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8pm04q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHbKmm1atdDjnnOic0DcowBAQruB2+30aHuYwNVcr32pLO9g/9Fj3BtEzAxilzRU0MdyPt2xAtoqfXx5TrFUe6j3Wfowcr0j5EOO2JSYttwl5yaczvrN91L/xaEYOn9z6c0oO0ddxHFGFK4F8GgM1Zo0XsEMi7vXj/qPP6kcJP7kjurYO2XCexRMwtf4B2Z8BYCnrOq/F5duEQwLu2o+vjWSWmI9gbDKJHkIpoQ7+SiactJpdvLN1ly+vDKECYDcVAI3lNPKAlbtn96HKzL2vJ+d+PnGMv3NE0mC/odF0nhQIemwbUSGY9TvjlK7IDoKmmkOSWPdP1mtK2vveqbfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aviSfIYTR7kbATCw4b+ytk/k5fIggXkdR0NTzkcAKtQ=;
 b=fUBEAVmiFnGGWG8derZn/C9b0+iJ1woNY9lZUJ9Bxw9WpXGWZK7DGNkAlj9lQ1WhgtUJkQiMVn3fcvIwupwWUW6yQUNYcILM1fvNWp4SBh8X41XOH9FxQwUCIbEiy2B6ZWH4EzZFU5OQDyB1uwiUjZLl4Aah/8ZJZlntP3yd19iDvUEZN1Afu23jBnSlS6UsMF/+D/mw/TpfBnBsy7Sxg/3w+mYscmXHsvSZqZWxJ2UPq23fcaynyyKI2B8CeEvzj3O975d0J7rB/5GNEbL7x1Ir319YfpYwSUo/wNeaOuDuFqdZjA9bO5qUFVjrvW3qSGMVXPtJc3E8VrEroug2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aviSfIYTR7kbATCw4b+ytk/k5fIggXkdR0NTzkcAKtQ=;
 b=XLP8+6PasZpxiCPjqhhGYUtppI+dRJL6B9XWitxGHIqc8pdwbswLdTsQp5bz9L/tLqWS1+uGXEsr3ZZXSfFWASxnOf2Ppg3/zNfHiuD06u1b1A5rfjoGfzB536QwGCsPEn+Wz3FdZO+KBUFB49ZpycQmjHB9vbvW9J1pkJsuyYY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB5994.namprd10.prod.outlook.com (2603:10b6:208:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 21:16:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 21:16:15 +0000
Date: Wed, 28 Aug 2024 17:16:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <Zs+Tm8LO6naCCQz3@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com>
 <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 190ffed2-68ee-45c8-2084-08dcc7a6a6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gkwpCN/jpswgysp14f3jY2LV3KuVlbUMp7Hs1QF3bgwZ1kMBKcyVXIOu9L?=
 =?iso-8859-1?Q?vSuh/6a8zjhq6SNYIZfxbu2fBYJVjl2my2D/81KKhNO31rd0TutvM1e/E7?=
 =?iso-8859-1?Q?Yp6NKkJH/krNgZbjZC47xJDNuYgYPLe6AaU5hqYuqb35wIMkI27yQFvFs7?=
 =?iso-8859-1?Q?tizgJp0yGAesEgufCGA8CO/dWBff03k9NkkfRXDfCMAt/0tET/qcq20nTP?=
 =?iso-8859-1?Q?f9IL6lKoYluIG5AvSWVdnzHXGzCUm/u5pTCjFi9DTEFeYMG99MVkfQ8Xsj?=
 =?iso-8859-1?Q?0W5mPWu0ozPLdo7gpqGu0pYxSFzPjfDudv94hBYbDNvSXQUPbpDoi7A1X2?=
 =?iso-8859-1?Q?cZZTY3wZHHALHGlV5Y6XoY8Z9LSFPGEkKta4nKEcBK3RNWzy5ai+f/T98I?=
 =?iso-8859-1?Q?FTDTkPx73whda8qXFW6oodQCxNbM4TZzTNwOQyoGEr5efAAW3z3VJ1BNSY?=
 =?iso-8859-1?Q?x6Hej3qqm4njEPRFMN/a4h3WXXg5bx5N5ujeA0xgxg5eI62ZH1GRuyKUo3?=
 =?iso-8859-1?Q?PoazQYkmK92FDtDEhLBS34aHVUYqeqLlZW/FdLsDrhCpRt+lU3KwsbvmNT?=
 =?iso-8859-1?Q?WPfM5OBbCpgUkwMDQG3pcVcj5J974wvBqc8mO1BL6QcDTsTQ8u4hznXmzZ?=
 =?iso-8859-1?Q?+bbQ4Kig/ba0L6fnXQef3CBxgjf9XYXBGPO1cIkWBXd2OypvLGKPJ8WFDV?=
 =?iso-8859-1?Q?ARoHU78jLypA2keVBfF6w3Wnu+KqPYRlnspEWsSNUqdkdudfGIerDwamTp?=
 =?iso-8859-1?Q?FTq+Aw+dc66ViyjpZS3/BjER015gCtC72tqQencBWJnPfRRg63MWpgrcZc?=
 =?iso-8859-1?Q?h3Ushhv/4jFylJF7JGDABr0s++3z0jnohTphinB0ECr83eFJlzCNbeVDVH?=
 =?iso-8859-1?Q?YV80bqopIDgP/XIMVjKoK3b0yHRjUdkhRyoFlApdlP5vIJpuHvr7mEGB4o?=
 =?iso-8859-1?Q?nasLyayGdxnKkKhXp7NG+BuoVgOBuxd07WOFbRTJ42i9gWF0w2Vp76KCtr?=
 =?iso-8859-1?Q?I3bCuEFXXqynaXuutpv1TIJ5IUGz/i5y71win0fFOiw4BqI9K8XMxS4/fQ?=
 =?iso-8859-1?Q?0C7PX9ARvUMGq+E3cL4IAVMfuqzU/dLHyiRnaF1NpboMrKRQq2AA5Pq8jX?=
 =?iso-8859-1?Q?Cg7xzRT2a5kcPZ+E/hC3xTzkC+LJuu3OE5wNxFV2YMYkmX89Nlw+O3C/+t?=
 =?iso-8859-1?Q?sXPabkEJZaDP1VbVt/j9S+32pNRHiZsi5PSRAb+hfJqmqZ+EIR4LrAtBJN?=
 =?iso-8859-1?Q?VNgv9dMIXjVilt40v08MCoGIC6ucGlW/jMsMYxbEVcddoHB0doUlgBWgQi?=
 =?iso-8859-1?Q?Sluswex+/lAr4/5vqfEyrGFrQH7xcexfKolyYC28yvKWOOE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qOy1q5ptrfw5aqVjfxnx2hVaqXcFyotWvo79PYrdr8OJnbqxho24n5CQ4N?=
 =?iso-8859-1?Q?Xvfksmlnc3vCz2EPxE5tQoXp12V3eNv3HttQ876i+up9XGpHpG+fhA9ixV?=
 =?iso-8859-1?Q?sANpIl/FX/vBnJMeFLsjVTIPJsCNGOAPJG5DvX3rdhdm1fom8mPQgG7giW?=
 =?iso-8859-1?Q?PvUqKHfzs0gzxLPU2XlWcv3oZq6tI5hQ7NWvOHb8GasJUyN8cjG0/K6gFr?=
 =?iso-8859-1?Q?0js2Oa1Gq9zDJ3EOYT1LadMr3QcufLbS8oplvWpON8UCrp/4qhnoCIwLIT?=
 =?iso-8859-1?Q?iNwLt5b8WDDUaN+xaM5vEk38ErXV+ZPYz73wIhYeGgdveyW1CHMYTY5fkK?=
 =?iso-8859-1?Q?b3R4KCT5WMw5Imz2ST7oOYw+gBk6I4ZEvTvF7T2apjQxpLVE2tMDmq5xFo?=
 =?iso-8859-1?Q?7LJd2hphaOfr4TvZUdabf9A3HyFhSDLdWHOhFTWHdRmP/OPV3BSNlBG4m3?=
 =?iso-8859-1?Q?PNtoqwl7yc/xdxw89+P7bTI1DiOO2GQA/+7OcpcZT3iyEuad+5nQsEoS+k?=
 =?iso-8859-1?Q?bkw+0PUF+7g6KECVnWYTF+pXnYN5f6uRcXe0R6EhS2LnKMrIQgLRcWhZd8?=
 =?iso-8859-1?Q?zFTzqn/af3tHJt8ZVK4Vet+YFRso9QsIFZ+0Fx4DFr6easC0uNxH/2qUNf?=
 =?iso-8859-1?Q?/JcyCns/Dqmw/+FyK25FyMd6bmjFdPCvA7GXkMHY0vmQDNlYnScybVbkqk?=
 =?iso-8859-1?Q?2DTiay22zLzJbcuPy2SsBZNrzXMppipgWAMnspGaV6GXnCPnhSpep34Z6K?=
 =?iso-8859-1?Q?v9YIczFzpuZa7PBP5kLi+NsB0oQuixpyqxzvUfc34OcoNKNfhE4Di6t1f5?=
 =?iso-8859-1?Q?VSMXumgYTRMKZg7GmXXfeakyP/XoISUob8SyAboLBbK/sy5yqhzKyDFdsT?=
 =?iso-8859-1?Q?8Lbuf8F0+2cTcSvDQrrz3l0V4f5RW2STyuVH9zVrbVYnyUhiLiaPkd2AmC?=
 =?iso-8859-1?Q?h6zboMx5aqkGZqhhmALsElzufRsgKM+rjBLFlFfDTqQm8q0KGLy7XuvwuQ?=
 =?iso-8859-1?Q?hy+4FdDY+wo6Uqi3Cad0C4/MtZXXVY4Z4HiWOlDKgmd8GDrBoX+CUyZQ9Q?=
 =?iso-8859-1?Q?ts11bFJH3MsYWGznuaU66ioxLZLBES2J3eKRE2UtY4rYRzZgZC0lKJhbSk?=
 =?iso-8859-1?Q?ffvPz4+asiG3SljrJq5a0K+qnHK86wJq2c1KuH1nunGIR4ooBHdoDkgYoZ?=
 =?iso-8859-1?Q?TchoyFV4YoHSDBi4qQqSfDT9qDA/1H3a39SBdjeQUgTRkT1EYMMZVmz08m?=
 =?iso-8859-1?Q?Myz+rCOMS5UgLpxssLKEuk2qvhB8e2iPBwVSJLhkMefZ77BzDhjuPYZSUd?=
 =?iso-8859-1?Q?o/6BH78QFUf8V/emnLTy9EWy3DGMtlnzbpIP+04aP1iwWgrcxJBT5hoHF4?=
 =?iso-8859-1?Q?FVTbVUs7ofsBBfjvKRoI0UoRJCxm8qiZauZcAqw0ILMtNPhMzuGb6nvs+d?=
 =?iso-8859-1?Q?mpDR23/bHldNiSLvMD9PKZY9F5ItR5fLAsByQs/6nk1bqsyvaElPx21soc?=
 =?iso-8859-1?Q?xLkMKavulnc7uniWUds0Vh4xfRbjLHNrWYUiVfSe2DyVr3LlkLWc8v99GG?=
 =?iso-8859-1?Q?vNfEX/4126YKNZ43dLBTgMg2o8eqJ5+SZczToiEsDkZN4WeEozsWgt3NGa?=
 =?iso-8859-1?Q?5F1cjbFIGGbSFDW+hEeovNEI2guQCY0z+s2kGp5Urj40St4iqJSR4ftA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	amE4vyVLL3NPgo1k0tr1UUCP7x6d8XHkHUzl7Wl9wMoT+eZSRmgmh+1jO7uCbGgw4j1kDed5dN5SXysSHCHFivhyiEU83kBH8/YE0z6VUbgZBin6s3+lmDbpbA5VNjrO/k27pu4+mopSo3BFsRd7UQOPk/4dL8wtqxnBQi1ODolrSCLUPkIjIv3KBeOX/9yqwk8eIqo+sa2/f/aua7O+XzrnZiRQD+A3QaNDm3QhOTpWX6pEChXucTjjNq/5vtx5YJpn2+OLANM1DsupqtCRB09JLJcilbNeLnt7Vm4dem4XdO0K+AYoGQ2Rqkl2UTj+tMC0k2vrNcO3VuXEKp909NtWOmARCtzmDO/jhqJWIdZv7m26WDY95Plc273cScOaClKRUZF0TUe5ImDZ/fE5YDQaOMy1ZkXPABpFENgHZCblpTdN0M7Ay+r9A+n9N3qwgor1HzdoznxziWAJGmUeF27OKt++FW5fjTZ+hK/DJ6Fy7cL24ePti/oft8kYygn7JgnGbzzGoeERVwdncXgWtvSLnNhiMGc/lzaNMsRSXBVAPHosmk3NafbUsAL3Jj36rX3qzK/U4bo7GlOdDMpqE4Xlo0By1BoWtnxuNbb7BOg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190ffed2-68ee-45c8-2084-08dcc7a6a6b1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 21:16:15.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO0Qb9XWpLbc2Kunr/xAJVDlqzOXnefCc0/bc66+ZTNvpndk6xYbunBIOvuPS5A5wabCMUFFmKF9NcodIDOMV4RFOOnDRsS3yeGUaZOSxIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408280154
X-Proofpoint-GUID: xRx8SFNEYCv-jQEYAVq7tqRe-NCml4Yi
X-Proofpoint-ORIG-GUID: xRx8SFNEYCv-jQEYAVq7tqRe-NCml4Yi

On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
> On 8/26/24 12:20, Kris Van Hees wrote:
> 
> > On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
> > > On 8/26/24 10:30, Kris Van Hees wrote:
> > > 
> > > > This patch goes against the intent of the code, as far as I can see.  The
> > > > point of performing the size check prior to increasing the buffer size was
> > > > to enforce the limit on the size that was explicit set by the user.  Then,
> > > > if that size was sufficient, then DTrace is at liberty to increase that
> > > > size to a whole multiple of the page size.
> > > > 
> > > > But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> > > > not enough to store a single trace record, DTrace should report an error
> > > > rather than increasing my bufsize setting on its own.
> > > 
> > > The point is that DTrace *does* increase my bufsize setting on its own.  Why
> > > should DTrace complain about my setting when it's going to ignore my setting
> > > anyhow?  What value does the pre-existing behavior offer to DTrace users?
> > > Are you saying that DTrace should not resize?  That it should honor the
> > > user's bufsize?  No more resizing (to page size or whatever it wants)?
> > The main point of this code was to retain the bevhaviour that DTrace provided,
> 
> As far as adhering to legacy behavior... quite simply, we do not. We do not
> set the "principal buffer size" to bufsize.  Further, any legacy resizing
> behavior is, if I understand correctly, to go smaller than the user
> requested;  we do the opposite.  Looking to the legacy behavior for
> precedent is pointless.  The situation is that we are unlike legacy behavior
> in fundamental respects, opposite in another respect (automatic resizing),
> but consistent in some impractical and useless respect.  That consistency
> strikes me as small consolation.

You can look at this from different angles, yes.

> There is no documentation to change;  the documentation is already wrong. 
> This patch was intended as a step to making the behavior something that was
> describable.  Clearly, trying to hold on to a legacy buffering model has
> produced a byzantine situation in the current port, which treats buffering
> very differently.

Yes, but if you want to go that route we ought to go all the way, and not some
interim solution (see below).

> Perhaps we simply disagree on those points, and this patch is DOA. But the
> patch points out other problems as well.  E.g., the min computation wasn't
> even right and error checking was wrong.

Let's do this as two patches:
 - one that ensures that the computation is updated to the current
   implementation changes and is correct
 - one that provides for increasing the bufsize to be the smallest multiple of
   pagesize to fit the largest trace record needed for the tracing session

I don't think that checking the rounded up bufsize against the minimum size
makes any sense if you are going to increase the specified bufsize anyway.
Might as well increase it to fit the minimum size altogether.

> > which is that if a user explicitly requests a bufsize that is less than the
> > minimum required for the given trace programs, an error is reported.  That is
> > a mater of being consistent (even if it has no practical application that I
> > can see).  Tests from the existing version failed because this was not being
> > done right.
> > 
> > As far as functionality, as long as the bufsize is large enough to hold the
> > largest trace record, DTrace can (and needs to) ensure that the buffer size
> > is a whole multiple of the page size because that is required by the perf
> > ring buffer imlementation.
> > 
> > So, DTrace only increases the buffer size to the required multiple of page size
> > if the user supplied bufsize is at least large enough to hold the largest trace
> > record (or if no bufsize was explicitly specified).
> > 
> > We could opt to change the behaviour of the bufsize opton to always round up to
> > a whole multiple of page size, but that is a deviation from the original
> > implementation and thus is something that would need to be documented, etc...
> > 
> > Aside from the computation of the minimum required size needing updating when
> > patches (e.g. the USDT changes) modify the layout and size of the trace records,
> > I do not think that the existing code is wrong.
> > 
> > I am certainly open to a feature change to make bufsize always be rounded up as
> > needed, but that is not a bug fix and I think that ought to be its own patch
> > (along with documentation changes etc).  And it might need some more discussion
> > because it brings up the question why we wouldn't just simply always increase
> > bufsize to be the smallest multiple of the page size to accomodate the largest
> > trace record.
> > 
> > > > On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > The function had a few issues, mainly with its comments,
> > > > > ranging from typos to incorrect descriptions of behavior.
> > > > > 
> > > > > The function has only one caller.  The enforcement of a
> > > > > size minimum was problematic in a number of respects:
> > > > > - it was missing 4 bytes
> > > > > - it was enforcing the minimum before the size was
> > > > >       increased by the caller
> > > > > - it was checking dt_pebs_init()==-1,
> > > > >       missing errors with other negative return values
> > > > > 
> > > > > So change the function to accept a minimum and change its
> > > > > return values.
> > > > > 
> > > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > > ---
> > > > >    libdtrace/dt_peb.c                          | 27 ++++++++++-----------
> > > > >    libdtrace/dt_peb.h                          |  2 +-
> > > > >    libdtrace/dt_work.c                         | 15 +++++++-----
> > > > >    test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
> > > > >    test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
> > > > >    test/unittest/options/tst.b.d               | 22 +++++++++--------
> > > > >    test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
> > > > >    7 files changed, 71 insertions(+), 61 deletions(-)
> > > > > 
> > > > > diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
> > > > > index 5268f089..4983ba91 100644
> > > > > --- a/libdtrace/dt_peb.c
> > > > > +++ b/libdtrace/dt_peb.c
> > > > > @@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
> > > > >    }
> > > > >    /*
> > > > > - * Initialize the perf event buffers (one per online CPU).  Each buffer will
> > > > > - * the given number of pages (i.e. the total size of each buffer will be
> > > > > - * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
> > > > > - * so the kernel can write to it, and its representative file descriptor is
> > > > > - * recorded in the 'buffers' BPF map so that BPF code knows where to write
> > > > > - * trace data for a specific CPU.
> > > > > + * Initialize the perf event buffers, one per online CPU.  Each buffer will
> > > > > + * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
> > > > > + * memory so the kernel can write to it.  The file descriptor is recorded in
> > > > > + * the 'buffers' BPF map and added to the event polling file descriptor.
> > > > >     *
> > > > > - * An event polling file descriptor is created as well, and it is configured to
> > > > > - * monitor all perf event buffers at once.  This file descriptor is returned
> > > > > - * upon success..  Failure is indicated with a -1 return value.
> > > > > + * The return value indicates success (0) or failure (-1).
> > > > >     */
> > > > > -int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > > > +int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
> > > > >    {
> > > > >    	int		i;
> > > > >    	int		mapfd;
> > > > > @@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > > >    		fprintf(stderr, "bufsize increased to %lu\n",
> > > > >    			num_pages * getpagesize());
> > > > > +	if (num_pages * getpagesize() < bufsizemin)
> > > > > +		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> > > > > +
> > > > >    	/*
> > > > >    	 * Determine the fd for the 'buffers' BPF map.
> > > > >    	 */
> > > > >    	idp = dt_dlib_get_map(dtp, "buffers");
> > > > >    	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
> > > > > -		return -ENOENT;
> > > > > +		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
> > > > >    	mapfd = idp->di_id;
> > > > > @@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > > >    	 */
> > > > >    	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
> > > > >    	if (dtp->dt_pebset == NULL)
> > > > > -		return -ENOMEM;
> > > > > +		return dt_set_errno(dtp, EDT_NOMEM);
> > > > >    	/*
> > > > >    	 * Allocate the per-CPU perf event buffers.
> > > > > @@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > > >    			 sizeof(struct dt_peb));
> > > > >    	if (pebs == NULL) {
> > > > >    		dt_free(dtp, dtp->dt_pebset);
> > > > > -		return -ENOMEM;
> > > > > +		return dt_set_errno(dtp, EDT_NOMEM);
> > > > >    	}
> > > > >    	dtp->dt_pebset->pebs = pebs;
> > > > > @@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > > >    fail:
> > > > >    	dt_pebs_exit(dtp);
> > > > > -	return -1;
> > > > > +	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
> > > > >    }
> > > > > diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
> > > > > index e0f408f2..9ad23252 100644
> > > > > --- a/libdtrace/dt_peb.h
> > > > > +++ b/libdtrace/dt_peb.h
> > > > > @@ -43,7 +43,7 @@ typedef struct dt_pebset {
> > > > >    } dt_pebset_t;
> > > > >    extern void dt_pebs_exit(dtrace_hdl_t *);
> > > > > -extern int dt_pebs_init(dtrace_hdl_t *, size_t);
> > > > > +extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
> > > > >    #ifdef	__cplusplus
> > > > >    }
> > > > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > > > index 69a86358..7a0eb1da 100644
> > > > > --- a/libdtrace/dt_work.c
> > > > > +++ b/libdtrace/dt_work.c
> > > > > @@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
> > > > >    		return dt_set_errno(dtp, errno);
> > > > >    	/*
> > > > > -	 * We need enough space for the pref_event_header, a 32-bit size, a
> > > > > +	 * We need enough space for the perf_event_header, a 32-bit size, a
> > > > >    	 * 4-byte gap, and the largest trace data record we may be writing to
> > > > >    	 * the buffer.  In other words, the buffer needs to be large enough to
> > > > >    	 * hold at least one perf-encapsulated trace data record.
> > > > > +	 *
> > > > > +	 * While dt_pebs_init() rounds the requested size up, size==0 is a
> > > > > +	 * special case.
> > > > >    	 */
> > > > >    	dtrace_getopt(dtp, "bufsize", &size);
> > > > > -	if (size == 0 ||
> > > > > -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
> > > > > -		   dtp->dt_maxreclen)
> > > > > +	if (size == 0)
> > > > >    		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> > > > > -	if (dt_pebs_init(dtp, size) == -1)
> > > > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > > > +	if (dt_pebs_init(dtp, size,
> > > > > +			 sizeof(struct perf_event_header) + sizeof(uint32_t)
> > > > > +			 + 4 + dtp->dt_maxreclen) == -1)
> > > > > +		return -1;
> > > > >    	/*
> > > > >    	 * We must initialize the aggregation consumer handling before we
> > > > > diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
> > > > > index bb77e37c..f62155dd 100644
> > > > > --- a/test/unittest/options/err.b-too-low.d
> > > > > +++ b/test/unittest/options/err.b-too-low.d
> > > > > @@ -1,6 +1,6 @@
> > > > >    /*
> > > > >     * Oracle Linux DTrace.
> > > > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > > > >     * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >     * http://oss.oracle.com/licenses/upl.
> > > > >     */
> > > > > @@ -12,19 +12,21 @@
> > > > >     */
> > > > >    /*
> > > > > - * We use a buffer size of 59 because that should be just too small to hold the
> > > > > - * trace records generated in this script:
> > > > > - *	- perf_event_header (40 bytes)
> > > > > - *	- size (4 bytes)
> > > > > - *	- gap (4 bytes)
> > > > > - *	- EPID (4 bytes)
> > > > > - *	- tag (4 bytes)
> > > > > - *	- exit value (4 bytes)
> > > > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > > > + * plus some meta data.
> > > > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > > > >     */
> > > > > -/* @@runtest-opts: -b59 */
> > > > > +/* @@runtest-opts: -b4096 */
> > > > > +
> > > > > +#pragma D option strsize=1024
> > > > >    BEGIN
> > > > >    {
> > > > > +	trace("abc");
> > > > > +	trace("def");
> > > > > +	trace("ghi");
> > > > > +	trace("jkl");
> > > > >    	exit(0);
> > > > >    }
> > > > > diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
> > > > > index bbbdb5c5..25efdf72 100644
> > > > > --- a/test/unittest/options/err.bufsize-too-low.d
> > > > > +++ b/test/unittest/options/err.bufsize-too-low.d
> > > > > @@ -1,6 +1,6 @@
> > > > >    /*
> > > > >     * Oracle Linux DTrace.
> > > > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > > > >     * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >     * http://oss.oracle.com/licenses/upl.
> > > > >     */
> > > > > @@ -12,19 +12,21 @@
> > > > >     */
> > > > >    /*
> > > > > - * We use a buffer size of 59 because that should be just too small to hold the
> > > > > - * trace records generated in this script:
> > > > > - *	- perf_event_header (40 bytes)
> > > > > - *	- size (4 bytes)
> > > > > - *	- gap (4 bytes)
> > > > > - *	- EPID (4 bytes)
> > > > > - *	- tag (4 bytes)
> > > > > - *	- exit value (4 bytes)
> > > > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > > > + * plus some meta data.
> > > > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > > > >     */
> > > > > -/* @@runtest-opts: -xbufsize=59 */
> > > > > +/* @@runtest-opts: -xbufsize=4096 */
> > > > > +
> > > > > +#pragma D option strsize=1024
> > > > >    BEGIN
> > > > >    {
> > > > > +	trace("abc");
> > > > > +	trace("def");
> > > > > +	trace("ghi");
> > > > > +	trace("jkl");
> > > > >    	exit(0);
> > > > >    }
> > > > > diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
> > > > > index 57fa030d..3bf08edc 100644
> > > > > --- a/test/unittest/options/tst.b.d
> > > > > +++ b/test/unittest/options/tst.b.d
> > > > > @@ -1,6 +1,6 @@
> > > > >    /*
> > > > >     * Oracle Linux DTrace.
> > > > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > > > >     * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >     * http://oss.oracle.com/licenses/upl.
> > > > >     */
> > > > > @@ -12,19 +12,21 @@
> > > > >     */
> > > > >    /*
> > > > > - * We use a buffer size of 60 because that should be the exact size necessary
> > > > > - * to hold the trace records generated in this script:
> > > > > - *	- perf_event_header (40 bytes)
> > > > > - *	- size (4 bytes)
> > > > > - *	- gap (4 bytes)
> > > > > - *	- EPID (4 bytes)
> > > > > - *	- tag (4 bytes)
> > > > > - *	- exit value (4 bytes)
> > > > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > > > + * plus some meta data.
> > > > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > > > >     */
> > > > > -/* @@runtest-opts: -b60 */
> > > > > +/* @@runtest-opts: -b4097 */
> > > > > +
> > > > > +#pragma D option strsize=1024
> > > > >    BEGIN
> > > > >    {
> > > > > +	trace("abc");
> > > > > +	trace("def");
> > > > > +	trace("ghi");
> > > > > +	trace("jkl");
> > > > >    	exit(0);
> > > > >    }
> > > > > diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
> > > > > index 96b0f1b8..23af81aa 100644
> > > > > --- a/test/unittest/options/tst.bufsize.d
> > > > > +++ b/test/unittest/options/tst.bufsize.d
> > > > > @@ -1,6 +1,6 @@
> > > > >    /*
> > > > >     * Oracle Linux DTrace.
> > > > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > > > >     * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >     * http://oss.oracle.com/licenses/upl.
> > > > >     */
> > > > > @@ -12,19 +12,21 @@
> > > > >     */
> > > > >    /*
> > > > > - * We use a buffer size of 60 because that should be the exact size necessary
> > > > > - * to hold the trace records generated in this script:
> > > > > - *	- perf_event_header (40 bytes)
> > > > > - *	- size (4 bytes)
> > > > > - *	- gap (4 bytes)
> > > > > - *	- EPID (4 bytes)
> > > > > - *	- tag (4 bytes)
> > > > > - *	- exit value (4 bytes)
> > > > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > > > + * plus some meta data.
> > > > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > > > >     */
> > > > > -/* @@runtest-opts: -xbufsize=60 */
> > > > > +/* @@runtest-opts: -xbufsize=4097 */
> > > > > +
> > > > > +#pragma D option strsize=1024
> > > > >    BEGIN
> > > > >    {
> > > > > +	trace("abc");
> > > > > +	trace("def");
> > > > > +	trace("ghi");
> > > > > +	trace("jkl");
> > > > >    	exit(0);
> > > > >    }
> > > > > -- 
> > > > > 2.18.4
> > > > > 
