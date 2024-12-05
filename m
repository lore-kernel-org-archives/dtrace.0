Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3BD17E019
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440181; cv=fail; b=AWQgRJiWjWy5n+L8VnMLQ2+fCqtd5a9q/wKIAxBc2z046Gl3LT2boJ7agyoNvAhPH7gD7md2NDFGc6ztRuwdFn7omtBK5KZ3WpZyu/qv1UGMvtzYN99PF7lmvWK4f0lgNznn1DNN27zDUv8UOcCxigPOHXCthvz/Oh7hpSHhXtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440181; c=relaxed/simple;
	bh=vImdcwvHkam6xtA556d2W6K5x/Ipjor3VpCAw3caoSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f8rj31z7dc8SClX9q5Eov4YNeyUyS4PDTRYJbAF4puNo3hBUXPB/VlHULd/0l5omoWG0GIWuSVV1gQO/a2pOQOuFXtlvgSIJpr5PYBPqgy+I0+/6zRuO8PFvzuH0w6UvQ72bYmXyF3034FTSJ1Cu07j78+LCYWqL5+YiqDjTQH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ce11K8GQ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nJK2JIju reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ce11K8GQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nJK2JIju"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNYSO017869
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RL1QVPWrcWZtDPuqNy6Lo0rsOgAUspfKzCHCkIELNhM=; b=
	ce11K8GQhPM3/QyQluTANFxRYp4hopqD1ex6as9xaXk8IChhlDfh8/LgCAnOEryI
	IR9CKOnxqBhlcregzK+UsWP5OJG9FeeS1ExaSYlvK+o3mjBnZtnUEm+E5VM8kU+o
	0TxJqUTQNxAk8WWszVBEAS6oS2KwUKIGVvVcHUfGTvFDaT/KFIQXZIV6WfS4vMDP
	4baWI1cqqJ63Zz5Hg50zpLtQoii0qO/NR5vy1Edj+yK3wtS13yD+2OAdFxGMEXO2
	T8Wf5foyqJa4+OZt8/YmjBbNuGGmnzQ688gNwXgCvCP//0OHMosG2tIw/OwzmBnt
	rGvOi6OqBYWWi4MCH9BvSA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sa04f05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:09:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LsSrm020180
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:09:37 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjg6e9w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:09:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB/IqkDGnk1JWHJXl9EsbtSwK/f4Fe+zX5lqOXYHcrD9IOC+4ZNOfzdtv7DwOzigymh1EP8wzp6eVwZtN8sBlDNvip//zxZV990LCijVonalSyKhVmqYPxzYFh+y+EU+L8EfMLSCNCVLS1bnKh+TYRwa990yIvrPlk4Sb5qLRK4pStpR1OGSM/btTf422geQrwgSkLXI96zI1kKaE16PWlkk+1qrfjnHxUPZWE9EOlB4oyBTstER+V49GpovGE5xITvf8lFN6KeD6n0bldCMEGu+EraGTvDSVAMbkKL5+pjDzoShyW8aLYh7kLUVeLo3Bn5jzZiJzQ2ipoy1G5e0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEGecM0FLqnlPfyJDVqzS7dZEcFc6c19JmZ5ywkrVsM=;
 b=DELniYw4F6/cwiRk2eUU1GPLGRSncvHtjiidyZ+x70nCZFHF3nGxLNIdlpW6rewbhLuR1sUjHAii33XDTVej6xnb7OuTbRslzkd5Tu/Hym2Bzobej6A8KoDsJO4tBGO5AnYgFu2p3o73FAZXMFr83O8K6BbMiISGo8Y1i0iHM29ekyxW+Z9P7+zsrRf226YB9MesF9w+vZTqpd4IN0zWPdWurvE6E+AzAFMIMzk+4xlTAgQ6ltWLL6g/XX8R0A0jcpOnDHb6f4dj3WApsotJtxtiwIw1jA9XiaSCq5K78cVnumhXLDDP2P+TTD7lM6LvG2o18BQRkWo/aWFX8FOPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEGecM0FLqnlPfyJDVqzS7dZEcFc6c19JmZ5ywkrVsM=;
 b=nJK2JIjuGjAxpHGLO6+BoHigwBA2D/pUxrDFHfdwu0ocdiCFQbRE2YBrDagbucbIhDUz64DD6P6OuW8ru3pZLclFwcLJvCNECVjE171TwIfCy+2SMwz49Ejbrzfc9jG7xK2pyuI1W1KtrjxL4DgbEA3O+6dm2zjXuzZf2ePXdo0=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by IA3PR10MB8092.namprd10.prod.outlook.com (2603:10b6:208:50d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 23:09:29 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 23:09:28 +0000
Date: Thu, 5 Dec 2024 18:09:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 2/4] fbt: clean up fprobe/kprobe support
Message-ID: <Z1IyprIkK9qUbYJ3@oracle.com>
References: <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <6efebe82-1f0e-2fce-3c78-cb734be36273@oracle.com>
 <Z1Imc8J6z85i1gEU@oracle.com>
 <b7c1fd43-d7e8-37b2-649f-609c54db40c9@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c1fd43-d7e8-37b2-649f-609c54db40c9@oracle.com>
X-ClientProxiedBy: BL1PR13CA0426.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::11) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|IA3PR10MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc85dca-0e0e-4c21-d171-08dd1581de9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rzJ8Rn/gFlue0y5NzYj1/SBgCsSBpojtnDr7NwgnEi/v2Rr3hs7gjH/De9?=
 =?iso-8859-1?Q?IuQkDsJimHgBostATxO8k2DBw6Ybd9kKbbURbhPkL4qztf0USv4RufRUCB?=
 =?iso-8859-1?Q?JGZuUB+thehLW5KQ1XxdW1w0xrBaI3ZVXs9VV02vJeqWpu+sc9YCRaiq6u?=
 =?iso-8859-1?Q?orFOpd8PLv/CM0bHfG3/qm6zB697qk1P4HC8tmlYAXi+uk81PuRK0Lia8g?=
 =?iso-8859-1?Q?6nzHqbItiqaGq+4gxOKq9aunkslBvVNBDQ6cm7jAOPOYa7ozTZyuCWXDpL?=
 =?iso-8859-1?Q?k6WnRd0ywPXPOiLicH/Vm+IXwS+TJc+p7x8h2lj+6XTJ+EXmr5WGeViXxV?=
 =?iso-8859-1?Q?mc4GNNoaRZU1V9P+gpjjRbpjLZG4R0JBk+34UBrQGTDNs12LDbjl/VgVKE?=
 =?iso-8859-1?Q?LEqPKkRXh1R/sb/+g5FfOsaVR+8Da2bR8u6uanXAt1QuKB78Y049SNfAzx?=
 =?iso-8859-1?Q?8Nhkm1RhEbFcX99/5Farky/aeStDhiAdQauiv3OXeQw+8QE/tGee5i+1TF?=
 =?iso-8859-1?Q?57j89aHbI8wa1EIAasoYrR7eiLOfauDkdruxE7wlifxoxesvKlaXb1RgPU?=
 =?iso-8859-1?Q?GY4D4FPzLOhI1NCt/3cQnRTr1O/9hZFfShjQO5mxTfLAN2A6TzR5R+nnNd?=
 =?iso-8859-1?Q?G/x65v8CoI7vKmFOTec91qDWjec9hIiPYwwFxJEvBRSAURdB9K4tJSBa2S?=
 =?iso-8859-1?Q?eSl7BgqYpnctu2HQvMuYcwDfqDy0YVRpU53FICJMXBhHb4l/RcQJv3x9Jj?=
 =?iso-8859-1?Q?d0S+7/jP+0rWIjP7ArQCty+7WWqDJyZUXXs9LJE68VEUVJpZdoc/OAZSLC?=
 =?iso-8859-1?Q?ppT0ny49ovcU792QcqjmSb7s+Roz2LKmiXKex3rUL1lK9wrwP6V6r2GcSA?=
 =?iso-8859-1?Q?Xu0SbACVkyOD3txQpwPa2glICReI1f0Zkmi1Gz/El4Y5A7bgcLBFQtKIzo?=
 =?iso-8859-1?Q?R4pMu9jG3QZGglMFM+I5MCGZbJm6e+y+PFQirOivNwNSAM9qEAdBTDFgVp?=
 =?iso-8859-1?Q?jjDwrCcZTAbvimkWceSUx9be2EoB0rboVpQ2r19JMRqt8Bzd3rHC9VB+cV?=
 =?iso-8859-1?Q?CmVebu7ka5oKya3XPoBKjJvYe5nDvBAHY/yPlBhfVsuUxRWfD2rZb0ZG0i?=
 =?iso-8859-1?Q?rO3QH+f2zzDG1Etgc2qkz8FaBYKI0TLPoE9/8GjllXPtHhwTnCumLoXZim?=
 =?iso-8859-1?Q?YhdHH+wwSEULgPHQre6KJdnrY3TKa3sD2FEz1qvVQDywcc4smIUI8/WxBJ?=
 =?iso-8859-1?Q?WScn9Emhw7ewiWmGE8rV4bZJ6mdtTMmpNE0trMHfULxFBNYeo5pnt1HbTd?=
 =?iso-8859-1?Q?RfKmOUzKZ2Vso3tWf8APw1rRICi7ijNwj6bvR1Dfbze3er9D6L1tqPi281?=
 =?iso-8859-1?Q?JUixgWiRLJFNfsdcU4YZwj6A6y8XnLmxEsEymQ9K/lhCHpSfcIIvw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?CpZveWqFm0eqHp3dLtiyNu5Ll8AiPdA2qxzl29Pa/zgQg7H34dOxJznUrR?=
 =?iso-8859-1?Q?mpo1Y0CnuHJ4kmLhDvj5jkXxepGPcWcwxYb/3MO5GBwB/htvj9SGa6gbsw?=
 =?iso-8859-1?Q?DPcGfUETvsoUC6mbEg3fYBYFWJvanIaMe5avLJKAivVC+tneBsEaDbZIf1?=
 =?iso-8859-1?Q?badl4RS14Cj3yQZCJ/hE2dCN0qTVa40+Y+UxLgio5XIn/CQ5NKLI4ZeX3r?=
 =?iso-8859-1?Q?YBHw+LXdlsKEPIBWgB6XoLdzPDYAE+Wu91jjnakrhmCjpurH3xNgMegi+C?=
 =?iso-8859-1?Q?ZYrTCoB/guGJEVPzw/hTD+mME5Ile+YakA/fAsAFn5RFuaGDIcxFQpxHAZ?=
 =?iso-8859-1?Q?76q7qJAyM4Frm7iSZjTg3pCR8ZW0F09TC0HnKYsiKwoecpYlhzxm/h/yBn?=
 =?iso-8859-1?Q?XAEg3XV86BHXz+5mUCbV0m+6LPhgGB9A+9jO9prvgBWiJsOnZx7zAwR7ko?=
 =?iso-8859-1?Q?Uvd4p7CEz+Tt7CiSKWp1b+w/gZ4xFQE7mFNr2wMo2w56aJ8/Pfyi6de26y?=
 =?iso-8859-1?Q?WTHAkVE6mZMKPd3rEn7d6qouhrAMBsA4rq0E4tVdVKtbAJ43Qdt02+wcaK?=
 =?iso-8859-1?Q?+1SVZND/dGCFse7AQfgFhaDFNTMUtRIX3rsYmjlcA+5XAYOJqFArlFTdIh?=
 =?iso-8859-1?Q?J0OtygtBZiCP7vhYkzhgxJUQZfVSfMGcs0fRHUDq2605zljMYxCCe5hqiv?=
 =?iso-8859-1?Q?4n6e82uS3PoPXBs9y86ZmJuX4QyPTtgBEfL6uQGqaDTLGwECtOVOFant9l?=
 =?iso-8859-1?Q?2JIXe2XGIbl9wXrAh6RL9SbGsvfEQRN0qSCjMjTqgYreZ6ilmphoR1sFHj?=
 =?iso-8859-1?Q?HcjQA4hHNVFPSNjLmcI4F1tDnnfgsrIkkJB58P58P1jegpzgNh2udQ6u5F?=
 =?iso-8859-1?Q?i52v/Z66sQ4slf4rfw58SbMUwduf0hue+lZYEvMWS2DequxtH8Ji2fk1PM?=
 =?iso-8859-1?Q?tfX9Hf33S5HZkRIyWNyn4pNKfPaoiw6otkYjsjwhU/OXoSV4CpSU1iK12e?=
 =?iso-8859-1?Q?eqzWBIQIC+l8IMnxagr8JlDZqKuPkdp4/Sg/XcVqxsNJ7dh/5T2cekmt2i?=
 =?iso-8859-1?Q?kGXFecdHa+DOH5EyM0lfpKAF0xxc2cjs/THaFGSgap9yUOuwitd4adVgSG?=
 =?iso-8859-1?Q?Ik1PSSDiaqfBQWvSH5UI+xbXgKdLCeiJGLhiRPBJ1DgS8lY7zoY/c0hSZA?=
 =?iso-8859-1?Q?cqaYomlite8TjL9jjGaAuJMIyZ20ZJhkZJhnA4U9zMNkqwgIUJFyA7K6W1?=
 =?iso-8859-1?Q?CWAk2TAUqm8PXbWZJixJCn9XxneYZjZug15UnsZcGUlekv0+lhNqxH3OjD?=
 =?iso-8859-1?Q?DFMoxYWnOobjtHK6zKJXp3W0KN7KQ02LBXp8SFW5+yxPK7hgnR8oa2j3si?=
 =?iso-8859-1?Q?3aVg6kLi3M6XnY1pdEcCXVDiVCteY7dx1820cjCxndlH3Q7tqbR9obB85I?=
 =?iso-8859-1?Q?m6GljiGgTtLgFWjc4677KKRdxtoNfhu1YbKfmzFAJly47n84QY5cgS/hbh?=
 =?iso-8859-1?Q?jOSxTy7vNmp91OfVJiHaHaNNR+DAIXP+utDubTvyo3CtczrzRIW9t2euUJ?=
 =?iso-8859-1?Q?qOYR1AojfE3DtjsMP6XjKauqiUL5AVcZa02zleX+SCgTJhNxSOHu4FjWpQ?=
 =?iso-8859-1?Q?MVV1EGXph1Xx/gVAbXmXZUyYDPW3BXs1sdGDRtYPgrPPUQGC3hwGEGMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMYf/GVPtoQI1PJWypxNUdh556DXjYtCXCnubhD7//i2svubLaFuTZ7YHtfo2NQbktpHw06uKKE3A0LQ0WsWPdv8bhQ4DVGnHCz6cpof57tQB3lsc+KxzHYGuZkgCmMo6WPNJJyM8zWkRRUVaepVh6hhfHDZjr5HSRUdb2OAmEKTBkHDhRcfWWPaBaj+/CnkV1VeUOAIPdHFPz4wCTuM3hTWoJb88jb+jKVUU2IpPh1ZBxLOzOOAYLunrnjwqGsCB2Ss/GHtOq9Jse1HihuVdknCOqGBzGbrfaiXeHfxDOD/PcyZF7Dbj70dYAurNpfuGYtwZV85/H04HlMVa3/Mh6X81Ghf5RyQItJEa8kyAaGUkrXUjGPYqS3ZbP7Kpw9utRk8su1ASm3CR+LF/saYjbgDlqyAOmhvVo8txn57DsCukAtjfvNBBJZGaZ/CgbtjyU164dXlHZnEkC0vO5ObQcYKCP7QSjlfA+rvB6dmGRIczh5DOQqfTmpvUXW9xF1REXRKAQteNxKnfdKe2dRmrvIPzIJeB7//M429tiyb81sCVAC4owIJHRgUZ932sUjuxSgCSA5CRIXiYkJxUSI7Fyd4xo/rv0MLrmAs+rQ60io=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc85dca-0e0e-4c21-d171-08dd1581de9e
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:09:28.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EjzHgpAyo7lTDOC/b15es4sqMTFtl+fHAhhKXqHGGI6cFRxk5l2dwyYYl2odDbdNAzcc/4h4QdPDVwlS5rdEFMFuZXerwOvAX6guMhykxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050173
X-Proofpoint-GUID: IjiE9Y2TOuBf5FeENZI15GhJ4erP0syK
X-Proofpoint-ORIG-GUID: IjiE9Y2TOuBf5FeENZI15GhJ4erP0syK

On Thu, Dec 05, 2024 at 05:58:04PM -0500, Eugene Loh wrote:
> On 12/5/24 17:17, Kris Van Hees wrote:
> 
> > On Thu, Dec 05, 2024 at 05:05:15PM -0500, Eugene Loh wrote:
> > > I wouldn't mind a few commit msg words on what "clean up" means.
> > > 
> > > Mostly, how/where is dt_fbt_fprobe used?  Put another way...
> > > 
> > > On 12/5/24 13:53, Kris Van Hees via DTrace-devel wrote:
> > > > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > > > @@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
> > > >    	dtrace_syminfo_t	sip;
> > > >    	dtrace_probedesc_t	pd;
> > > > -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
> > > > +	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
> > > > +		dt_fbt = dt_fbt_kprobe;
> > > If the BPF_HAS() test passes, shouldn't we have basically
> > > dt_fbt=dt_fbt_fprobe?  In which case, one might arguably go back to the
> > > ternary op?
> > Since dt_fbt is initialized as dt_fbt_fprobe (the default), this conditional
> > sets it to dt_fbt_kprobe if fprobes are not available.  I figured that was
> > obvious from the code.
> 
> Sorry, where should I look to see that dt_fbt is initialized to
> dt_fbt_fprobe?

Oh right - that was in the previous version.  But on OL7, gcc complained about
that assignment.  But I didn't complete the change in the patch I posted.

Let me post the corrct one (and yes, the ternary comes back).
