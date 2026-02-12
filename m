Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2831C3C08
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912128; cv=fail; b=qp+90I+Zsz6KNtw04sPYNsgDTH17PxplBxI0Hj30OMeSsah3H1cazMj6BgI8Ue1iwc+zIEBnt6R8as8FCfC/9uMXbFnuW9fnCMO4CNDXlb1q+DyNlIMeNgA+6Z25AdPTRrnOuPBLButrrUaCt8otNMRXdSo7pp6xiAD/UJCaOkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912128; c=relaxed/simple;
	bh=OjawrJjQE4UBrqayLWYi1zqkXnEsnRJ2AasMFUm8DlM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=BJmdytO8x5Yn3aDVAIr7xBLZtAhI+/DetNVJx+w5gOvpTmSKr0bFkR9NAol/zk0H3PNj8VFCQhkDGV7XJaMEZ1QLfkFaFiEf15fiMKZ0qucuWgKkkwVNp1rzAwEPjriJzi++vohxUdqVsIkIM4/U/oDCV0iGB0bcmVbU32YzKc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FT7mvrjI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vaW27nnf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FT7mvrjI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vaW27nnf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CEtxuB798025
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=auo3Vkm6hnIqVj5uy/
	zZyySNIzFIxYaaAqpEPpdK5ik=; b=FT7mvrjIm5BhPMmO9YN6mp8RY33vWShRnI
	1472xEZ37EKNZZLdS1CTEMmxvJnl0E3tAqvcj2j5/7Cis/O+PmN87vGQ3AxinCj4
	53PUkUklQdAUWOHqgOhzrxraVgT/fj4YjEIOPhpzcv7yumR8NP/wu4S6ch9bZPU8
	X24dsz/RFo3XeIO9TlPQxiB2mXHLGPH0h5TYOnQHabfHDj1OwpfOyVBYiLSOx7Qw
	FgwNhm1XjwEPlvQqiypl1Xkuyrm0Z2mC4/iTynYfncpq4Tsz1JmvSJQs+gB0v5oL
	/rSS+RsVGLlJlV7KCv/PbXEFm8FMuMzlqEIK1aT5TuKVF6fvRzqw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88n7knu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 16:02:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CFCOY7012969
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 16:02:04 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c827247x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 16:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxOW3hopoCq8ydD9cyML9tkljxvDbdx/M8a6wkvhxxJSacAuuYlXbM+qAK+u1/Xyn5qjDgKlS6Ch78LnAxYV5SgZ2LThj++2aXgdNJCwqRNkUOTitqcqMXzB2c/RD9VbKzAztFwD4Vj17e5LjhcMy+I7ne0oJtYUv+z4TOgzX/il+c7GsqNloMT/CzZjOWmVdDx+CGv1RYbJZIRPTbk+tFV8tVYMymZbbYk6JnolZtVcjfyou/vTGbsQLxz8j2yPGLhGvyMgcZlzi9XcqDyhtOGtvTOMTyGeS/W2DzsWOHFcNNY6Fsd+TJBdksf2RT0nWFhd2OW9fEUb0ZamwThUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auo3Vkm6hnIqVj5uy/zZyySNIzFIxYaaAqpEPpdK5ik=;
 b=POiEhEoYbLDXIbTYYpZBDfcYrojYO3MnpGOls9kGckCCcvQ+/MtUu958thj2dPpZ6GSAkEEh1B8CbA+sBUadzZeyIksy5u2xQlCjJnOg06IpW5HxBaRUGNZIs69rIGVN488ZBiIuDEb4ffPHLbYgmbCNDlYi9wjxgh13Fkj0X96M3PuWMFEPmJncQUL4erEe+8/a+b6iEYKQKoUnxfF5WSfIv2Vi2SC5TNO+uMIcO4k4mnSCi0ei0bM/+hPvlco3mu0gbcoaLU+6xrhjIlsHpokEzB7Ncj5Ju73EFc2wdlbfW7cZyMW3NJsv1NX/2rgmEQXcjvGmmM2FFVvIXhZ2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auo3Vkm6hnIqVj5uy/zZyySNIzFIxYaaAqpEPpdK5ik=;
 b=vaW27nnf4pVesTGYyW6Ad+xVA1nF37rKZac41BaSztrmOsd1pZ1501iFmFdXMVS8zg2IlO3StFI6tKDBb9Udvw1MnWLvkOVIZnpkdDaaA0kIN4Q1tn4PCiN8XzvzdNAjROywSCHRKsVmLXRN3+qNAe4S6Za6+9I7ghvIvoFZHIU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA1PR10MB6268.namprd10.prod.outlook.com
 (2603:10b6:208:3a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 16:02:00 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 16:02:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH] uts: remove unused header file
References: <DS0PR10MB7522337539F9353C9813DB7BC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: ... it's not just a way of life, it's a text editor!
Date: Thu, 12 Feb 2026 16:01:56 +0000
In-Reply-To: <DS0PR10MB7522337539F9353C9813DB7BC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Fri, 16 Jan 2026 17:48:42 -0500")
Message-ID: <87ecmqne6j.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA1PR10MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffe4a2f-7550-471f-92f3-08de6a500df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kvne51bNwz7vSW682PGQsrcMcnIVu2geVmKnilAKyXXhyv/z66ka41VJE4Vg?=
 =?us-ascii?Q?jRtWNz8Dt+BFUUwHyfkaHqAUA2b0jZKP0Fl5QfIBZfcvFlqIWKqwvnYfql8t?=
 =?us-ascii?Q?r7KEp+N4Q5PeH5OA4GIyFW4imiER0ly55DcPNpIDDQoRVTvvVgNrBCe4zkWJ?=
 =?us-ascii?Q?ilzIZMBIvGOZivdFAy68yaUOgNa6Q9Yc3Q09KiE1q1D+A9+4VxTAYxhCSO2v?=
 =?us-ascii?Q?IbaQDAP5a2e9oi+j3GrZeQPcgc8dV8j279J/P86qGQ1qwx5grtJjKN3uyNtc?=
 =?us-ascii?Q?C/XIRq7ZgzvIaINOIyRt5rwHtRa+cFQ2vqY04J2IRfc2E+hIis8ruaRWdL8a?=
 =?us-ascii?Q?VRPtLgYm5ZqeKGsc7U6N81rxsbZNKmg8cDCV1HAscG08yt9s6jwFStfka7+G?=
 =?us-ascii?Q?Dqn9MQzv+zJ/wJkzkwHrZGKrJgutUGK/j+cynv/A44NMQfhZXj6gMef5rz7H?=
 =?us-ascii?Q?WFBWvoPQLkuIKL3Zux8/LNjIK3/NdmtuYmm7mFoBLfJ7kn0B4VBM9Nh3tFEE?=
 =?us-ascii?Q?XnY9DC+dT19t3Lkh2B+zNCzyJjVbwZxxSrapR/J1HMjRHchMhwPU9mspm3L0?=
 =?us-ascii?Q?TrAnYINHvyErbAx58W1e+ZQoqAo3k/WzXNnp94soJcYISWNXlNmwbRyJraPZ?=
 =?us-ascii?Q?Sq+Dyyz3DVJ5NPhl7gbHo941WEFYioLolSM/ke0fKYGJHqswAG9LNpohCesT?=
 =?us-ascii?Q?2jOIF3xlmhx875sIFL22MxL96gGE5h2FTER+OCMpXUQKX8Cs4LpUTJaQbCH1?=
 =?us-ascii?Q?JahpfEFDV/mkSlRmKlTgwTk6KTjwzCCgRy1tugOezqcx8DenMB9DTEJBrEzE?=
 =?us-ascii?Q?HoWoxrDlJ7UHt/GIMdedxp8kZ7Hv4VLgnq72TsHqSNqEKBHLPCWGsC5HBALF?=
 =?us-ascii?Q?9C++/IEXMg1KWwBCuxiKVGnBRwmqxpFkMp2axjDoKG6PB5+AcbZdEwd75L3B?=
 =?us-ascii?Q?jXfKkkWwKkGB4zsoNYT0uA61rjhOIOZVYSPjNJ+UcHs/QvXnCNxiBi/uiqdn?=
 =?us-ascii?Q?bWbYA7j2pgaRBwIfTV8NVQoWHM+fsDGDH/GtwFiPb3p+TqlPjk4ZiE/diJFa?=
 =?us-ascii?Q?suxjnCdWar12Tu1xAVSUyEOapT24PVL90jMmXUx219QoNXjlYiz6ILvF1Ntd?=
 =?us-ascii?Q?r/qnOcYuduOQQl/F8rk1+DWaCX7EN6wopmr6srlh68JsdEy7B1qEfdlsg0Sj?=
 =?us-ascii?Q?Ac09Ie1tRvi/uPGhIrfOQ9mZup+F/1I1NGcI83e6A5flYy5lS5gompYBfhK4?=
 =?us-ascii?Q?A90EvBxq/J1Abc5EZcWKzaJNRwAl/f/F4GVj3e+02jgZBkJDUQdZFieK0k/V?=
 =?us-ascii?Q?BkSOFz57l6B4Z2w5zbRv0sxZOToK6kHao0qoHbTByRRhXnSyfadHVxFf4WKy?=
 =?us-ascii?Q?sNZXg7xHW+QKZgm2udh7YGPSxBguJ+r3QWWm0uUVxA7N0Ll31IDvXUeYaVaV?=
 =?us-ascii?Q?39ahfmyTJd/4Q4qdDlr47hYwoUHNDEJRPii6/+aVWBpFXWveun7Gvspkb5G+?=
 =?us-ascii?Q?7mYn11zSmdWAY+dv91ZuMT/s82v8SX9c1CYL+ltC+0cBSuxBry6hu5QUckvV?=
 =?us-ascii?Q?xZWOrC+pICUdJERjBSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DRCtlBPYv6RaM0gDznx6eOUhPyG7JSB6rjZExUJGntPfiUvvVwkRANcTb1ss?=
 =?us-ascii?Q?CEczFXBQQVTUuYtlYgN7D7vGpC/9bBwF/mziZaShgAa9gBHMS1EqbpKlPBWW?=
 =?us-ascii?Q?UaSI55zh2VMt1uI68NhB58Yf8S/9SLQaEIJ3L6LNNIDj+E95S5GUZlcpT5Fs?=
 =?us-ascii?Q?HqCjea6bFcxtPtrn6h1Kbwc/rIvdtAO26wk7eQCR+dMKZiI+LKJuoMewB81b?=
 =?us-ascii?Q?6H+RNzgOP4WJuXt9v8lmttS0luVDESvoMDAGOLz/HzJ/xFeizZI6EAhy8iHf?=
 =?us-ascii?Q?bAmouALT0SJ19yq2tEZtHKJ+NHJXfnIIqf4im7lqdKpPIb3AoTyx0zV9frty?=
 =?us-ascii?Q?yWJhUBC2Co2gAFmSqEAxfBAvdGWplJ1PRMPfDypPg30/pImchdEXj85TEF/s?=
 =?us-ascii?Q?3hOLr031g/LvPFj4Lut4oCRtTyT8z6DFnoATbl1gCRLbJS8TcH9Gc2kvXIcI?=
 =?us-ascii?Q?/YbeNdteymgXK+FL82bAxPqTrwDAq5Qh/ib0iqBHcBYASTCbZbDCnG4mXB1d?=
 =?us-ascii?Q?WLGRBq5+8ienPFj8qJYO3KZlpm05LgOCFw/NMeqLJUHM2bAyJXG45hVmajY+?=
 =?us-ascii?Q?gvSaaa1+p8bh13BXEtBMuBlAXbTbmy6N8LNGPxbsDsCtWXx85/SakT22mM6a?=
 =?us-ascii?Q?4FEthh7pZe5EAR7IrFyNeuoUl3swzBc9TbLk7UlSzdhq0FwxPQzIPHxnlcnJ?=
 =?us-ascii?Q?6fw3gsXjKCIcgzYq2wpdeA/vOi7Q7YO112tsS11RXzXxc7gKdT0JDC3HVjeh?=
 =?us-ascii?Q?PEv1+/aESQO5tR70Quvs2HRSMKodt49dbo8dpUZmxPfPut0bA35JmUB5d4hA?=
 =?us-ascii?Q?UM+2bm74GWcBQ44o3wJPHOeKU3/IbqfS9OugT4N2c4B2jFPViTyJAnbeD7t4?=
 =?us-ascii?Q?DiODO1c3wU/GpBG5+WNheCW6YnlX349KyQZx+E2IEEGxDM4zKod/hZv+7WIh?=
 =?us-ascii?Q?e7yokBOljr3iWlzfZwR459EYtx8taX6AM3rd9tWs6/PkF+ClaBKUb3ofilca?=
 =?us-ascii?Q?gZlo44ncivablt4Hejv3HVjvNtsFm6c7CaS6RRND4iT6rWpXunizRLvLbpS7?=
 =?us-ascii?Q?b5pMLnUj+Dzy6iuDXNc64ZG3Hpmpl/h6XnFyifv/H7s92xgzaUD4+pTtq+v0?=
 =?us-ascii?Q?90pmlFssgGBXuTDUrCL6u5hgB+XIeztQV1pTYnDC9xFyd5VUM2ss0crVQaR4?=
 =?us-ascii?Q?ZwYIMGA5sTOqvof5aOZ6fRvcWoSYZWdm2c1hmUoK5B9vSu5oWvnJb0n+QonN?=
 =?us-ascii?Q?89aeK31at+6n+ZGGL4+mOKJVCLUOWVK7w73DURMUIZNsQqIM1amlhE4v6n9K?=
 =?us-ascii?Q?zx3vyMMajuramZPsGtssSrRf6nmpiWk+2jOm5AlEmwq+wzhegzJ4cxa40kTp?=
 =?us-ascii?Q?R7tmGlKy2DGQYRWcmdWhSIstXkRq2waecRaOoSqURHZODemMyQWsRIVZkdhg?=
 =?us-ascii?Q?CPyxfYvsc3pZSFiByC+8IY62tsbeJH1aeU72MLkqKSCbKABNLmS5ipTZD7TI?=
 =?us-ascii?Q?3nfoX5t0cyOlNp9NQ59q5GHy8EEATKm4bzOQaEJqdy6w4Ax9e8PeUCToQp4s?=
 =?us-ascii?Q?vDHDlpkEYXiilttcoHc8tm92XekoKE8+lgmX7vl9XChVILIinuSN+eeHKG0d?=
 =?us-ascii?Q?K3WwZ6iGm+398D9HIazBEe12FKspYRWgMxqmLkqIQE5Da/hfENBlOQHl+OFk?=
 =?us-ascii?Q?cEL+JID6gqcujJulpiIp9IebiXbzGnHBV3jA+wpAKq2gR/vlUFVy/x36rbQl?=
 =?us-ascii?Q?B2/r6AF/9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NvGruKjNVyy/w2gTwsfsLG3Cbh1BTVNNd/awaYY9htjqmxZMXU1HHC5bfvKqg0nU0hry2LqXcLvZn5KwwpQvj44foxjGOiA9ZetRBw26ZjMZD8j4rrNftm1xbx/GCEK9YTKyfzHyxRa3X52VVZBXFp5FdCDg9mN2L7qv135xPURREzZJguvoIn7bCyprhixbCqEsboX9nHP0gomqYhSn3itdd4dRwc7cxmY56HDGuB9CTFlp74wALzUfmzVzgfzzQMA7sAKRanFAKgdx2qR++3A9IeoqQURfYpr0ls9sK+E0PqwBhaDeeTdZoP1+wvoO895yQzW0VsinpObp7bHl4utvdbrqvA5lVF27i5tAZZvxItShWGYIGDRvaC6wZUofvQKV3Nrd88yspF3keTxX+VeuntwGrTv5q+k8+z+hbpTRO0osOLFsZZf7RibFSoxE2E4L93zTkkA/txRJzGAYg615c+3VpUfQ3GTQBdafT86fGgXlsQF+MaqoUK+3pxtZAkb04tl22zJgYzQuvFe4l1qtktpYZSM4xSL6PrkA/jcjfaNzigB3gI44/kWJW3tN05Cmi1ATD30RbvTadDlSpxOioGY7bX4FPTi9M1l8QiY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffe4a2f-7550-471f-92f3-08de6a500df3
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:01:59.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG8OG2Jp7Z5yAV6sVDOymdYV4YH3YRyCnwCaSfTzX6YDBYJi6yDYVWd6wuNiHQhjXXJQ8splapBbVP/wW3QCgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120122
X-Proofpoint-ORIG-GUID: kuPBKY27N0ucZVpww2dQ4FvdT2EwJf3Y
X-Proofpoint-GUID: kuPBKY27N0ucZVpww2dQ4FvdT2EwJf3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyMiBTYWx0ZWRfX/hHAZxEbJAKv
 8x7JVH6tEkFzaNsiLPdSpKc+rrKGRMZtwSqz3p15qnaRl5JRjCqHnUAeMB+qERFiULedF9RcFnk
 26PrC62d4dRUIXX/9xY6aUAEPkmmhXwLzu2TJq5m1Cj+KIKQbxvJrO58fRK6Yc/A/xuFuh8zRZI
 Y5BPLE/wGFkfiB1ljo1exJzeSAPEtyJOJi+CBLCMCqkD7n10TogitRP5MFBKzTB8mJtEOFlER2G
 Z6oVvJNC8MNTc/ZbiFFh8NGo39zLA3K6xdaN86nts9X+Qzx0T8CFY7hqO35llyrS5gwTHov1eN+
 jNlQrRTtN5lRnm822S9Wy32GUQ4FpOhHffSyejcsXMohK41SM0o04Vo5GRVxxwkWa2K+P1Qyued
 Nntg2YHJ8CQN2XcgchcgQzM+3qIqcDYXJwFW0DDZv7ky2BdvFdxUrQIxWsnDXyP7q84HxPMgKK1
 KwHdHmNdN0CQkKIFpU7KNBxO+2m1YhioHsdxAcYM=
X-Authority-Analysis: v=2.4 cv=O5c0fR9W c=1 sm=1 tr=0 ts=698df97d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=kHWt12DDmcUtAietxFEA:9
 a=QYH75iMubAgA:10 cc=ntf awl=host:13697

On 16 Jan 2026, Kris Van Hees spake thusly:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

>  uts/common/sys/mnttab.h | 88 -----------------------------------------

Unused since libproc/common/Pzone.c was removed in
2711f09c4c94be6d28f54effd6618460d3c22133 in, uh, 2011. Sorry, I must
have missed it.

-- 
NULL && (void)
