Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972A217736
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885111; cv=fail; b=nZhBmdewo4TpumBZR3Ou/3ulZhhXkCuyLA3YfAgDmQZhp7dXdOul/CvH1QgsjBOH9FpiYO2yg3zFu2dlsNRSpSQ6C0EQAZ2gjjIeqZswjxLyUK79LetUy3PrxT1F3fTaktcV4a9lJm6oni5iL5r1Q16lnCEKfgEWrwzdYQV3Pww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885111; c=relaxed/simple;
	bh=fwfd8lsXtPRZqonTkxq7T8FuUrOrnz0exjbdrNmOnuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qs5KKKs4JN8i6FS18HTZQDbFS6+USz0srzSItShMOoCdoCV/YOoalGMX8e+TKPKA3ROWl5t5lecqMrEL+re4bjs/dcb7wBeYcdexn88O6KHzF15rNTOnz/67fgJmzHsqmhPBYoKWtMUUBtWveUyfYpFSgDVlQgXVgLJezwG5atY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R82EMuaY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QRdbx0x1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R82EMuaY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QRdbx0x1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UDMuYH017488
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Z8olK3ghwpTeMbFS9F
	q44gmiK067Hb1cduSsGu5tU2o=; b=R82EMuaY6k+kjEhCXXOtUv4tZ9aK0xkFh+
	8Gt+7OjnhKXnRqcIIejJGP3fN+qru9NVY4Zz6COCUcJTP4lj3MwzLgPqSaOhTuwe
	aaAHLnCI+jCGFn2O2uiZerC1mGrlUP4sU6smUCQmRKIt+Bjo8xkPeoU4oLGKIye6
	yxbuMQjiSbx1o19eqlPfpoC9nTCyneeBqXurP6dNEzoSRT/RhccjXC+vDWiaVDMV
	aKgNYSvmWuJ6CkZqoaRqw60UGgpK1bZdjC1Y0lFKSIdBhzk8IvM0yeE6rV2iyOw+
	aHRZLN95PP+8Z+2WwNOoI91YbX+4UK0a/O2hkCVLFv0mkM10Qh/g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5wsu6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:18:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56UEAvTV016739
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:18:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfhjry7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j65KumUv9ZXjZOTe/mqvuFJOrG501VHCObw7t0sW6Pvs73gYNxnBFQ3VDWVRa+H6NrQXXZFRuYRkZnaI6gNG3SxWzkYwdnb8gqBLiHw0EhP6sLqOxGAg+0VE8aUjIYSCuvrm6exBIQC9+CYXX0EPZ2Rufeo6u7ccBFDLi2+l+dhjEZ8KQCpXAaCIFmHhsznBF1xsHfnMRrbxNEiBIicwxLkXXFPmwDbc0RIE2EJDFFdGMDemYh44nrA3hyyE1dxIf0A0AmJr5syILGVWOHTGXN3HerIxSCxBTiPXIHzySURJcEYg/cOJStXN11+9MfC35TZrEM2ZYP4j8JHs5kWjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8olK3ghwpTeMbFS9Fq44gmiK067Hb1cduSsGu5tU2o=;
 b=Ngdz6emwNgcZEoPerxmvgSR6Cw6rPpQ4gnLcaehwVkIbOxK2bLGPSh/qWIABDKQNd+0OPxW5FJY3+YTOZ0ln3Qh+5MPlSKah0RdaEEIBOJcKcU1R3eQ3eUJzVK19Q8ub+FewaSV6K5AdBH/OPSZhWpPYOCtg3AXaCAUu0efYp3Al55KUZtLHmKtbtdETkSoD5ICdy1HE9mCL/xWM7VYNhp9OvyyiGAp0MGyrIIqF5Vo3otpgysbJYGJr/F3HOsSVYY6ppA7kAwyMJPdGkX3P+sWKfgxSgqDOnbEfamJo1O7FQ8jyXx5hUe7Py1zv4Zz8cL1VjpkCZuANeXeXNn/6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8olK3ghwpTeMbFS9Fq44gmiK067Hb1cduSsGu5tU2o=;
 b=QRdbx0x1miCL4oztbfJ2S+XQYuLtzQ/nMftu0u8mZ35pXhF4VfTLGsOoe3PhJlYEMH4G0mTErTwleS84PA/JTi5emNWfStXQQ5bOf0wdE+K1m65bWHo2hitJbu2g7betvf80MzUw7J2ZfgGE9AQeUQDNJfqFWWyohmWmit/O+NI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS4PPF9390CCBA1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Wed, 30 Jul
 2025 14:18:21 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 14:18:20 +0000
Date: Wed, 30 Jul 2025 10:18:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Wait for output to flush out in enable_pid
Message-ID: <aIopqYJP3yn8DzUf@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628223050.3396-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS4PPF9390CCBA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 159bdfa3-7be6-44d1-be2d-08ddcf73ef5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5TTt8TEG70raGd6rYbGa4LpzkMzwjyL07SKw6m4Jg8Srl6ECGkaJ0+y//aS?=
 =?us-ascii?Q?2XrRKpi0GLqKJ3Tvzi9Nl+CvFPL1QeJEBke8SHqwn4HjvSR2zxOnuD5eBqVi?=
 =?us-ascii?Q?MqgyS5/S415OHHX8xmXZc8MP2RH0TpLOjqvQSdEzsE4pP8/neHk3irYsJFXV?=
 =?us-ascii?Q?wnKKie7tKc50wHcumERILYN4+OK42ljCRPiG2uwbTYri60DyNjClKICRM5CX?=
 =?us-ascii?Q?uuZaCV+6Wutcl0JZ3YXlcYKkHql1kXTn6dRYA+ugw2rEnFkcuhNR23xfHIyB?=
 =?us-ascii?Q?A29ggzGKPqyiQeT5IxYlLtZ+PGi2HCb5Qhx0/1sBFZm4MtgSDlaVYqshvm++?=
 =?us-ascii?Q?Lb37RDtwJOhp4HlFGzHTEAc+swq3on6TfrWLPsrjzMGnC48MsE/w1Aw8M5HO?=
 =?us-ascii?Q?qmx99ILyhP3W3FzxGrJp/lwZiGWuFzlzsTmPzud3wmALiI2v7ABlKkEG2QOI?=
 =?us-ascii?Q?WXR6wo9+DSKHotU3onMYBVVmNJhBoGsznyGO/BX12rZEmeT7P4aaFYUqcb84?=
 =?us-ascii?Q?iUbAXiaombaQhYOI7yI2u2l1sXxIL2agea9PkDWrgM9ahEdxDCy5PrUiRkLw?=
 =?us-ascii?Q?O41hgMCjlwnI9d7kO349k5NY0rLgB//5wDg9tDVh8ee7VoY92nuhpJSz9/cF?=
 =?us-ascii?Q?HrKazcPSoHzusAqx0gxGZScvVti1obdb7e11/4DSgaFRexYEVCCYvR1qoPm0?=
 =?us-ascii?Q?E9ah6ouwT+3C10bu8R+V8BHxR6CJSBuwKGM2MTNTHSUzlV7sqnmEruvdVYrj?=
 =?us-ascii?Q?sOMijgoFzTaUvpAI42ybw9ft8PvDRDcAk0/q9qmwMh4Z5BAWwZa08HQBNXLt?=
 =?us-ascii?Q?5ofJTYP+IZeOZpXkZWhZbCONlBPh2khK7h7AvywgBGVnElEmwj/BpS3qhI+s?=
 =?us-ascii?Q?I3lX/nFwLBv7nhxGxsrtCxdKAutbUJJoq/elVGsHjoomSC6P2l8akPaa9lMe?=
 =?us-ascii?Q?4GaJwclhzmNa1g7VSbpIjWP00+EMRB2UDZlD/cAt/JjfzU7eTNHbobhQdnkP?=
 =?us-ascii?Q?h3em7MoMj4sAtnUZJMhpTsgfGlE3tlgYVoBC/7MFly+W8/r+mbBEVvX2rDgF?=
 =?us-ascii?Q?RE9iLXVsJahPIq4MtEpMu+MLLYnBcq7VoZUfWg3mX0tSM6fIcrjzLg/IQ8j2?=
 =?us-ascii?Q?Twd7StY7TNYEwX2Ay0EGBKHPNFHWLcUqs2Do8Qr+go4RBxy/d53KopvWhMog?=
 =?us-ascii?Q?DmcGGUg6a3JyCtj9R+Zi6l93AfgBH47cD/Qva04QLHlQV9oLTpkiAX5WZPXR?=
 =?us-ascii?Q?DtuwRYsFOL/4cjVRvRlMLWDudKPagSAHzkSYQ1I0LPy3o46lmoY/aTTtCBNP?=
 =?us-ascii?Q?57Xaksi0TjOtgTRTKuZ2jfTXkrKewWLg/mc9O19aWda2QbnnrXe6yG46Ubwj?=
 =?us-ascii?Q?+ib/YcRgMdjIRIUCduuVH8TCYNsf2EcvUyszMjEjee49viT1cQNtFJ48g5y1?=
 =?us-ascii?Q?V0rUTnVQ/T4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t537f3zRHDoIeaN7oU40WZYhM6WXu5fUCz2SAMyl3Q6qpLvSu+RosoC6xyFW?=
 =?us-ascii?Q?tSlhO6K/QwjWggqTahojkD0lOUF3dOhG7bcBZtSm4wYUiS6EFLv5DrSYrT46?=
 =?us-ascii?Q?gqhkJ5eRDiFL0VvA4DSE4yhZzcsM5/plFJhE+DIXDg5ln+R5iPKpPmmTMUX9?=
 =?us-ascii?Q?5knLe7UCCzz+oMgnCDsIxX/OGCAP+ql82lfzGm3wZNPLxCxEAkdf1ocYkTvw?=
 =?us-ascii?Q?t/pFXdluZHctlcAVnnGDVVmKPgxgVNFGMqfhdY3b367zG286u2fRSPjoROf1?=
 =?us-ascii?Q?xsqg2K8vskFW1d96r/CbFU5mCS4YuNJ3ssrNGnfQycOwJHlvjKjKR/Yj+cl4?=
 =?us-ascii?Q?96CbhkhHgizmcgGJM8nXA43U7DMo67aKz2K6GA5DEGMaDZ8FcwGUnmSl/pVM?=
 =?us-ascii?Q?9MRfBoYnR7DBUdPZm/d8eviejZ5EfjYVbHUEEhKbiYmcGOZwKD6xREkUHedA?=
 =?us-ascii?Q?u1+k9Nefn4+h0PGbzLICkecfBQrcKy2zQDkIn3raY/erZx0pL4d8n4SF/TCe?=
 =?us-ascii?Q?5d9j2Ds8nHHZcodZtv9PhQ7CwXP0jVCOYUhfXzapGjYwloXXaifCDLuExg5d?=
 =?us-ascii?Q?GB2blAGwp1bCDmU+LNPRk44PSpLbL4xlW5bXsyUnZTjm7UT1kSgqkNMUFj1y?=
 =?us-ascii?Q?khFHVIzagN9OAp5ri4JzpArV0SRDhaExA55mqbKQHkqJeNx1u/3rJ8zs8ebc?=
 =?us-ascii?Q?MAL934IkRM3J84PDMUXHaI1oYIC8jTqb900/oF0RjZ77GMUkqhWOU/O2ZK5Q?=
 =?us-ascii?Q?S0hpv5hT8Yiq+r4zH/XTBMeht94J1MPtkdnqHWTxhKaGzbWu+3KEueeSRHiH?=
 =?us-ascii?Q?4/hUBCUOVvKaDe/SrwBUFZ/nG7c6E/Dhxf/QFC/k8T9iq3ydWbZ51iPZgPHk?=
 =?us-ascii?Q?VUFtNvjf3gD2RTqtmyqovaUjjYyEsyKB/ovE1n9cOlDEy85aBkY2Kvmajga5?=
 =?us-ascii?Q?UnBK1yIe1bigNgSER2AVzP+ASlH3oXuKysDQSjjtA24OUoIGLCqofxpozp57?=
 =?us-ascii?Q?7Y85pznpvWu3ziAxaa2GaL2fGdj3Kj0NPcuASOZRawUwDu3d4adQpTYhrG31?=
 =?us-ascii?Q?g/EQCW4Y9ihm7ndtWvgJpYUKz/vcsoihbdy17wgdkQftU89miVJRreaYI+ii?=
 =?us-ascii?Q?m0OtOVP2dDHEFup7e/Mfta5GnS4eENY63iJMHT4T3LHq/VIjdSsARzNw35im?=
 =?us-ascii?Q?m0urApuzpLxwZoDZ+7iJkDl0IzBBOif+5hExoJZCkCvUQXn8UsDPOPFBWX4Y?=
 =?us-ascii?Q?9QcB2mX5DgG+7RW9nEv4n3LkizRNJxn3L4F7+2yJz5wOnfhtFG5XpRkX9eLs?=
 =?us-ascii?Q?A821TExCrk7rCXcujkmK6rmPYD6UWUHqE7ZoxNknkeH9NewZmPCqVlBETkMC?=
 =?us-ascii?Q?wz+KGcM49rMK+t6jCWAzElBB7dndnO91t26HLHOTADVzqbJffnf+ImSOLqUP?=
 =?us-ascii?Q?D7uqm2W2HyUOHKawrLCMO0W/7Rg64D64JQ7GnwX6J5wPjYOWo1cfz/gHMjY0?=
 =?us-ascii?Q?zmsbi7wDDXDvvnAqaTdj/9ThLD9oDSPQ9P2b+Jp5YEhjAHGepInfIgL6JXMe?=
 =?us-ascii?Q?hpGG3xH88xmHgbxVHeMvO/9KKeGnycPujcUdDohVCn2ryHLnuffdT0C383Nb?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7/8magsH3+BHaM8mu3qabfrOAGXz5HIEqTXjdt2wNZzA7FpUYznTDwvN7XbmAtGVUgxBCbJ0XRsbI+3w7O56OmL+lNuDb3yJ1j1DG2Ybp4Kb/0RIWr5QQBQzPADFwtFszuqhee19IG06GCoMIZIccARJJ4sZhY388kaW1KldukY65g9uCaXiAk5rs18UP+X5UWlToND3EENmmSBowRUrOMTmMUNU7sS7EgLRm5Eavp/ausOdKWzM0Id66kSJnRJmSlGRrBqulEDGDp2WdZkFVXhQxCKsAB2EO76mCkem/HWbWRrstB04cq51hg15stpXkMkxOOCk3Y9CZt9Dhza0ylhqyVnSCGujR993X/wRyvJCCO/vnzjpGawAeMQWb35/m7Go5aAq0Gpk/oncvZIXH8fCsroRjzR6CFrYXCJ1GrJABU9pnRvEcQ9wUpyI2X6Ah0NJvBkaTfkvj18SWE0aqCdsp3dbjm66ns8iWCNFLuz4N2/9ELgs67kakW+r0adsj+ysuA4reW8dZQYrKUaar4V4t7NtW08N5ZDh5Y1Gi21/f3PZcXPhm7QgS2ZaQWoPmKI4WkcKCPAvBamcG4wvKKq71rSoYJG/3vAvyCS55wY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159bdfa3-7be6-44d1-be2d-08ddcf73ef5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:18:20.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA5nloVMxR8FKPoQTw0XZQpl8p5mz50GSzfQA/nZmW09OlPSw5lEpO9XTxNSGYB+zLDv5buQzZ5RRD7bCDjKbzu3MUvmEE0HUp/wOgx34V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9390CCBA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507300103
X-Proofpoint-ORIG-GUID: KeBUs9VcQK0B2vt03cZr8J6lqCPeHbR1
X-Authority-Analysis: v=2.4 cv=LdA86ifi c=1 sm=1 tr=0 ts=688a29b1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SjWomBm_Fmn8StVMWUgA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEwMiBTYWx0ZWRfXwn/uS9nOZ/78
 qaGq5F5fQN7xHiUOtnVC4CQpLmJAvsAWPVXMD9PlNR8wUL/fhpprE3QmqaBlDLSQYLFf1GfFQEj
 xu4F8UJQCLP9YHmG8vYXS309BEPlw0Kc9y6aQlrnMWTeyxrMG58djwBeUwfc+3pdyov6jbKzB2W
 phImuDMaeBybRT8UIl/MD4NU7ZoGb1l3xxrd0RJJE9p0XjcL8dvZ6IACdc0lVaCjfeyY3EYCMTs
 mnxUUbDXMfkJ7HF/hORTU3EiBPtFYfUolG6+HCuIF9efYKqGWpZ8qJ1qFU73ykcMAmLa6M6fZCD
 pcB0egKYUQK4I8jn3tv+iwnXiUMNOoMlgjhauQoCyoLQG1TUCPEPsnL0SuZd61YlunxSZl5Sj0e
 6sSwErCWn8tynQko6x1+ezNSeeXYMarB61AEfQ+rra+/MWBYW84HkZvtvkqYQdYJuG3B4ym/
X-Proofpoint-GUID: KeBUs9VcQK0B2vt03cZr8J6lqCPeHbR1

I still see intermittent FAILs.  I wonder whether there is a potentially unsafe
contruct at work (see below).

On Sat, Jun 28, 2025 at 06:30:50PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Our luck with this test has been quite good, but it sometimes fails
> to show its last lines of output.  That is, we send a USR1 to the
> trigger processes to set off the final output and we immediately
> cat the output files.  If there is any delay in handling the signal,
> the last output will be missing.
> 
> Have the processes terminate themselves when their last output is
> flushed; then wait for those processes.  Also, skip testing altogether if
> there is only a single processor to run the two, hard-spinning processes.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/tst.enable_pid.sh | 17 ++++++++++++-----
>  test/unittest/usdt/tst.enable_pid.x  |  8 ++++++++
>  2 files changed, 20 insertions(+), 5 deletions(-)
>  create mode 100755 test/unittest/usdt/tst.enable_pid.x
> 
> diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
> index 7f4f68698..296cfb382 100755
> --- a/test/unittest/usdt/tst.enable_pid.sh
> +++ b/test/unittest/usdt/tst.enable_pid.sh
> @@ -33,6 +33,8 @@ EOF
>  cat > main.c <<EOF
>  #include <signal.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include "prov.h"
>  
>  /* We check if the is-enabled probe is or is not enabled (or unknown). */
> @@ -41,7 +43,7 @@ cat > main.c <<EOF
>  #define ENABLED_UNK	3
>  
>  /* Start with the previous probe "unknown". */
> -int prv = ENABLED_UNK;
> +int prv = ENABLED_UNK, nepochs_left = 4;
>  long long num = 0;
>  
>  /* Report how many times the previous case was encountered. */
> @@ -71,6 +73,9 @@ static void mark_epoch(int sig) {
>  	report();
>  	printf("=== epoch ===\n");
>  	fflush(stdout);
> +	nepochs_left--;
> +	if (nepochs_left <= 0)
> +		exit(0);

I wonder whether this could still cause some output to get lost.  I would
actually move the conditional and exit to the end of the loop in main(),
so that we check nepochs_left and exit when <= 0 outside of the interrupt
handler.

I am running a long sequence of this test to see if that helps/fixes it.

>  }
>  
>  int
> @@ -79,7 +84,7 @@ main(int argc, char **argv)
>  	struct sigaction act;
>  
>  	/* Set USR1 to mark epochs. */
> -	act.sa_flags = 0;
> +	memset(&act, 0, sizeof(act));
>  	act.sa_handler = mark_epoch;
>  	if (sigaction(SIGUSR1, &act, NULL)) {
>  		printf("set handler failed\n");
> @@ -172,13 +177,15 @@ for pid in 1 $pid1 $pid2 '*'; do
>  	kill -USR1 $pid2
>  done
>  
> +# Wait for the processes.
> +wait $pid1
> +wait $pid2
> +
> +# Dump the output.
>  echo done
>  echo "========== out 1"; cat out.1
>  echo "========== out 2"; cat out.2
>  
>  echo success
>  
> -kill -TERM $pid1
> -kill -TERM $pid2
> -
>  exit 0
> diff --git a/test/unittest/usdt/tst.enable_pid.x b/test/unittest/usdt/tst.enable_pid.x
> new file mode 100755
> index 000000000..9506674ee
> --- /dev/null
> +++ b/test/unittest/usdt/tst.enable_pid.x
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +if [ `grep -c ^processor /proc/cpuinfo` -lt 2 ]; then
> +	echo test should have at least two processors
> +	exit 2
> +fi
> +
> +exit 0
> -- 
> 2.43.5
> 
