Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772420A5EC
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729827; cv=fail; b=H8/yUTsmwegywMu3Yq/xcTcL9zZYI/khwdrU1p4djdu6vfiAOkH0n0bc+yktqGI6vpUMoNK6q9h+oxHYK+5YbcBwlZyzVfJwT/zH7nRxoGn17OIr4eblKlP4uxEf/BFoqM9md2KngdUgXMXMY8cLBmlXsDyGWeJqnwG4JXBT9Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729827; c=relaxed/simple;
	bh=pP4IqruiKNgkpqeS62A0O4CBUc3GECQJvdazm+uJEiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NUWOWVgOK88jdw5MN09jFarCtcw5In9Ta/pJyApMBG9USsN59LW29/Z96OocI4m1mGSuVzuA43wGSwfPKfZUyhtFGp9F0x3kQWCtM9rC6izsKcaKdGVHouvx8gGC4gXMsWvYFkTsi3MYhtVEqkR74je60h3GGChMzR0XGcyVPi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mT6WRTtL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t5gJJDZH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mT6WRTtL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t5gJJDZH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FF0w0H000946
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VhP7I2I4WAAgDJlE9e
	LexDzfm0eURxyK0CWdB+A3WzY=; b=mT6WRTtLTKZ2kgXLvwHmnP658gWJ87J14+
	eQvuiSMxnEcLks/s529fwKrezaTIVwrBj3tntWUBlJlKNzqlLo/u2vhjfQXZVTc0
	zwEMTnmNriDnSKvfoB3QgiyoHR7jmgpO9+mUZ8HBLrANFlcecBQEizZFwv1u9cuT
	29b1D0ePx6fsTLt3poshrTXI2BMfHUIlBuLgZDaf7LAQWVpiUiJtgI9qyTOIOleL
	sv0+Q1i4kq+dWKtbsbdNqU9YtQE78CAp1lgt7XnjPF3YTDoq6AJwqBWq1lG/jFTr
	i167EHzFRlmo3A3HeJt+T2eSB/1EBL5jXlwiLPRE/pyyiVvme39Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185msvac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:10:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FF55SE005731
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:10:22 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010018.outbound.protection.outlook.com [40.93.12.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5vefx5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ooo1M0d55a/B0C6ZJ3g+SAHnic9pMvvgG4DeGNMr3nYpo7K6yf1G9gVLRrVtvCk39aeN3Xtdliwo7pr0okfZ3+08h66jCk79mHU01cKCI5mnhLrE+BYxvlDXKN4CSNm7KSE9lPnp1HPOJig0wrAb+b0xXsAk3+OoxFReDHYoFbGD9aD3MGMztD3ShnVPUyXHlmcFozuBEr2A1so0UYh2maRkt3ML3QDco9njwdnifI4yZZMv4uOdmT7YiLyV6A271Ww6msaRvPyKJr+kIrhDFnj83fKpdFdWlZRz9xKlYHYPtZhOYlB4LcXQpxt8lfXlsSRcn/PUjhXuE34rjLQlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhP7I2I4WAAgDJlE9eLexDzfm0eURxyK0CWdB+A3WzY=;
 b=EGjkjMndy+IMMSvrwouc7Cvc4WIRhGlZUXfOg2pEO5ahl3wY2r38TNaH5vLXhzq/wCHiWyP5Bz3asS6ug7XA4guJ6DcuxURZGTILLSMXbFmaYAhIknR+7aCvUGTv9QjQ2wl5pJYNfBS8+tL+oN6sf6n6kmLTRvIfZXvuElWwe1TbcrsZjIBSic0mCGGeDDd1qCkjlwXNs4jih/peCCukO7TWkwaP0YpPBu4cyNbJKkI9pR2U5ertVTk6gJJsQ+ymO6QN1sMH2PlKOWZ7Ah40+zCp3r+SOkATW5wmAJQQ/77h1Ltujll2CMCnjxbHCHZobojM213dkYuSXCPFKgzqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhP7I2I4WAAgDJlE9eLexDzfm0eURxyK0CWdB+A3WzY=;
 b=t5gJJDZHdBMw3C38ozprxuiS4q8cdRhsACzVpIlo+gFKjVNz5nZRXUvpoAvpqfkpSqKibEgK5GRsBgIpQ/eDuD7jYCo8kpWrCfsi17ZRamOMStDedh891aonirtrcpofgtGA1jqb8kez7bacnBkWEs/kmk7xYDVSdEI3PMNVLws=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY8PR10MB7268.namprd10.prod.outlook.com (2603:10b6:930:7d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:10:18 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:10:18 +0000
Date: Tue, 15 Apr 2025 11:10:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] test: Remove orphaned tst.lockstat.r
Message-ID: <Z/521z9UktGxzDvk@oracle.com>
References: <20250414201959.31327-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414201959.31327-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY8PR10MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4ebf46-df1a-401b-ddd1-08dd7c2fa20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2lkPPOm5CW8CuIc0JKA8dxCwEfW4eULqb27OyFMSCoEXz9sv48Qxu7Uiey1h?=
 =?us-ascii?Q?vdtbNIaWLrLPPKaca8CKf9vigjM60xh1eM+GOSfhjkpBm1nEIoWYPmI0VSwJ?=
 =?us-ascii?Q?6t7sm0pJ+AtDekLjReQNQNdV9djK3lcq13ODcqem9Kb6qx1pNFMXm6NGR5XE?=
 =?us-ascii?Q?R24iLwOiEFIC2BMKn+5anrbkShtfB98IQN5gvA51OtnoP0auXdRwdMMRpw3e?=
 =?us-ascii?Q?Mca1IBWvsug/quuIRz06d0yNHHbukcVKZcu8pwprvgzicroH7cnxyEj6SOrI?=
 =?us-ascii?Q?i5ir0UeDpNP3UEE22etS/ZxAJEtedZfsXQHOSUHDshmrvLHXwqSh4HlwsjBV?=
 =?us-ascii?Q?zVhdR0JL49nuGWxGiak4QUcAt8ttUTdlw4CsQk9EssA+joqILDiaPrkY7g3m?=
 =?us-ascii?Q?blrHF2hWOcH0P1ZibKQDroCb9i41Q5hwpl2DDoiADmrHXeIFcR9gVow+sGmV?=
 =?us-ascii?Q?YQBkXhH2k/9X26YzOJqYgcn1//P8j/sbAOd+GEbPJIruhQo1r3/h10AksrGs?=
 =?us-ascii?Q?ob3xATW83PYtf3STDuuTS1hmNmBm6wKC21k3Fpm8fMgaL080CIdAUSrzTUjd?=
 =?us-ascii?Q?AXv5WfEEdRIHZODSg53Dfbm6x//E8rjzCUFAYcw2rVz/0S/4iOvep22nCDpV?=
 =?us-ascii?Q?++OECQq5Pc3lFsjX2IVNVEPOOj8yvMumE4hR+31HBH3IQBk1wAQz0iaF06kE?=
 =?us-ascii?Q?S1KtyL0W/wKGai+vbGghmpWgKznPKpIg02yKuLs7qvQ1Dy+akcq/7Pqke2On?=
 =?us-ascii?Q?ov7lHp+WFjQQLKrQIYYjnlxvbN5JSY+IFw0+L6T/+Vn2xAPxltLEWJ3PUBoW?=
 =?us-ascii?Q?u0SY4smIIv2Z/bBxH7VrkUjIwP0HRZwlg88p4vzmSdudczkHnzFE3iBmQu2G?=
 =?us-ascii?Q?k94ZPGtGrrqMMb3AeXWJqFmpQ1qUsH6HXGNyq2sfYR2+d5kl2GynMy0D3LwF?=
 =?us-ascii?Q?lDkVy2xTS3qztl+DmjYrN2YjR9emwdyUeJO8l/+QbJ+LQGzRMCWLcJSWPgtS?=
 =?us-ascii?Q?2spI2vDaSOJwSYIVQ9M2rkm+vp2SjH5nLP+RzNk8vkGympsy/st2Y317EfdM?=
 =?us-ascii?Q?La3iA7/6kJM/hTRiKsAVB6Cz3x7UdtZJ8L0W8HzTOIOhbxFHtRrg5nuNOXxn?=
 =?us-ascii?Q?2LEir81uQy4683DQrkzqbVjdT62JAKyU6je17a04ZuQOC4zJaK6a0WY+Ugce?=
 =?us-ascii?Q?OHWEmhwRDLOz24mBUn9EkFXrKF6Lu8Tfu7dbYzM4/LfkmsFXHOoL7QRmENrj?=
 =?us-ascii?Q?JREEZHz3KLiuiQE3UTrXDJoiTkLwJsF1WtGBGRgeyarz3zIXYRAuawgxFSNm?=
 =?us-ascii?Q?pkNruEIqIjcbX/FfuIy/3o97HYyHpINOc6n5bKPOB0BjUsYdQEKshCvoCDuo?=
 =?us-ascii?Q?4/Eyj4iHKlr3enqx4d0FKq/9UnpAhaY3Gf0yW9wKvVuKPImO154RXyqOonhD?=
 =?us-ascii?Q?O003krGIink=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mpjNpAzaO3+CYg3LB7NXtxOjK50FGWjaXmZy2DeMbTA0XJeMfIpS9UvutTFb?=
 =?us-ascii?Q?InV6C+hAkFxeKc4U8CdragHw5AOi/GpyyyXBLHtGLDZS1U+sBdDPTekqvBig?=
 =?us-ascii?Q?tloUotMWgqoS/ky0jpzrc0kf+W8jK/wkocd0CKttMID1gjoNyBMaCaQYVpUo?=
 =?us-ascii?Q?uyOtzljN7o2/g+KXSL42lbKbRB63nVaioRgtYxqkXWjRuZ3Y6RgudC9It7tg?=
 =?us-ascii?Q?fp3p0/hPx9mD9r2I2pTNmPPlqJ34kSNlmWyjdi3+H9CcwtJCdKegGoNL1I9d?=
 =?us-ascii?Q?GdaWyokEHCBfiUL4IU85qFt70Rfrq+/0eqdRY1sIDY6ftwmNPs7yxmYfYhdI?=
 =?us-ascii?Q?IRHReXBoCMpkBzh3vNCVFr0xdabt+6fmfnNnU8zgCNCIccvEHiCEp6n/8Zjc?=
 =?us-ascii?Q?zBCeHLT1bpwaDqSBdf1KQu5tqzL5Dyh2OH1jO/fWGY2UbMv2HTwDdwqyn2vI?=
 =?us-ascii?Q?rTrb9mR3zNrYlAXjNrZo2Y9tHg6eMOFpCkc/y6avsKPLg2lnIvICg3OCo5nR?=
 =?us-ascii?Q?d9pfJvg0MDI45fl2MpcLneYGMgkPB5TT7KbGlYUdQjTcbsHMQReFQQYC4RgY?=
 =?us-ascii?Q?1TKeIio3HBEbeM+MCMhSyAioS8CRAbEcakG8/xhM7iH9cdkXC1ob/BFHSFRU?=
 =?us-ascii?Q?OC0KLpeCacx35Nlin79d8/8Jie1rmPd/hqjBgErSzEQu0lp3lqZHPRXJl/Kb?=
 =?us-ascii?Q?LtRxZo0r2EGdyr68/EgHRnQthO0QacctkThxEaETMceO9hNbpCxu+mchn7rL?=
 =?us-ascii?Q?W+/+L6aqQ5upVhL244dm3h0KotvBg7jrjHFwNTDEfWuy8FxYsSak60AHgES4?=
 =?us-ascii?Q?tp3f3aU47On4JfIXDoiU0WA7DJOESxFgeBz+7iDDUwtSRGA4xoSpHPMGTaB1?=
 =?us-ascii?Q?xeWcW8lWX6F9+sedpkIVW2vydJQE4gmbE2EYRqCvu8mXTEE+FhLKYYb9fHiy?=
 =?us-ascii?Q?sFmGXlmVHKSZjh+AKekDQzhSDoxvXAjPq8hXZl/MPzaoaqaUFya5ZKzJd9fx?=
 =?us-ascii?Q?vCOvfgZPsbdkGgFAGy+V/Rqc+Tnrvox3NMW9zdLygXrP5s5ZeXlhYmlxKrzd?=
 =?us-ascii?Q?x7pWRJVw3cEeTd7jQ0Y4ruKkoFtjhCLA65m3QODrPmGXC7LGO8agQsZlP0yC?=
 =?us-ascii?Q?O+Re2aFsXNYxzUnkz3LvfpHKZfEK8EuzGOBHjhRFz999S9lIPP2beWEHyRSy?=
 =?us-ascii?Q?sacrJ4qjX37z7dKDsOk9/Ixd9u4ZG/wwShbA60yU2+NOvnyVxfw0UjsM4jtP?=
 =?us-ascii?Q?IP5Yrk6w31x2MDU3pqcB/GCfCSvTh+5Yl1Tw5vVdfgDMWs9YGWb5HL7AGzqq?=
 =?us-ascii?Q?AXEmUBfz1leNX38FUkKfbqIdUUtGFoX6SFoeUfmoMvjSFBsbpHn7WKl/Cia9?=
 =?us-ascii?Q?YkvGY0dQlpLLXzrQ7eAwB6LD4+3wifAfBvNV4s40euWEA8zb7ZxaiacwlsYW?=
 =?us-ascii?Q?NFhvlW8jyEzuAiqqBQp1TN8IFayZm8r3NlcTEWgyi6uq1HV+XGgT8//hvNYO?=
 =?us-ascii?Q?gmHfAOHDZgrBmmjOjLwzBJzrVcFH/VvXbffkg+4X1n+MvsffqEkO/ddsIahI?=
 =?us-ascii?Q?it6T2Py155L6Bz9BPR9Xy6cyXcm+E3pqmGd0lbsjqMB/EaoyuCfV29xS+KGe?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+UANwx9ocyCB2HL6YeOOIQTvslLk0osQ7ONl84Gc+YnSSwMU6fuE6k8qd5JqXy6Uwo9RgXAqxJolxrg+j0cmm63qJOXZie333CAs5ws5D1qiMlxXdA4XKA1IWQGMM10j1hRCcIXgHik9WvExtxprgHDNCleoNlDhvWwRsSOKolj1DyLvSFvV9eOYYzy4qrAYs5ctv7o+gtH0rHLs038wH223Lsol42gmB9P+SBAiZcsNxlKynZks2M6+Gx5dk7nmR8RPEcPSgDT434mGD6wW0gEXJTXmamWQb77BkfVPmhLEbG5LXjQ5gZmfVUvHIIa3HF4JNWmKlmUW4W5j1UucGTp0f6l8tIFEcQTULYcZHHT68W2zr5y1XvDVTLa7nT2xNhsK8B0m0EGeF1yjtgxU0+SXnwWl3uMXZHW3/MHrBz+g0BOZ5F+/gy0c0QyfUfuyo5tSgAI098a51x/rDyi9ul02VrJVB2FNuCmi92kiTG+Yu5CzTfD/XtnQzKtgzekcp4Dl/diIW54C3sNhpyakQM/3oTYjfNn0hx3whn9v3ZZ8GcFjYj8JUkgfaGL6oRhAX0S8L96qGa7ndFnOJcgrRjKvqBFwHV4VnL6DgZKcp9o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4ebf46-df1a-401b-ddd1-08dd7c2fa20c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:10:18.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9Tyw67F8g4T4Q4nNJqjFxAwNKF1qNPv6DyrOnZuBZSTnZVf93UaBZMvFAC3KaXdfKuF3tiygUaciEorkCgQe8PdY4fxFsAis+8z0fGNqxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150106
X-Proofpoint-ORIG-GUID: SdWg8BpVbg2dvkA3VdxnBS6Sr0xo8q76
X-Proofpoint-GUID: SdWg8BpVbg2dvkA3VdxnBS6Sr0xo8q76

On Mon, Apr 14, 2025 at 04:19:58PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit ded09d05a ("test: rework main lockstat test"), a lockstat
> test was renamed.  Its .r results file was thereby orphaned.  Remove
> the orphaned copy.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/lockstat/tst.lockstat.r | 13 -------------
>  1 file changed, 13 deletions(-)
>  delete mode 100644 test/unittest/lockstat/tst.lockstat.r
> 
> diff --git a/test/unittest/lockstat/tst.lockstat.r b/test/unittest/lockstat/tst.lockstat.r
> deleted file mode 100644
> index 5bdc40c67..000000000
> --- a/test/unittest/lockstat/tst.lockstat.r
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Minimum lockstat events seen
> -
> -lockstat:::adaptive-spin - yes
> -lockstat:::adaptive-block - yes
> -lockstat:::adaptive-acquire - yes
> -lockstat:::adaptive-release - yes
> -lockstat:::rw-spin - yes
> -lockstat:::rw-acquire - yes
> -lockstat:::rw-release - yes
> -lockstat:::spin-spin - yes
> -lockstat:::spin-acquire - yes
> -lockstat:::spin-release - yes
> -
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
