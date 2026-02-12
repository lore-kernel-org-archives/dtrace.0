Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90151DF25C
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921437; cv=fail; b=J0snRu4ZHJX5xpokzoTQUeU+4d56LnRsC+4jT5tfgmFLyaLhmZYvCWvYX1O+XdbKTELjSFzHrFs7XQC2qLN7/Z4O68k37R1byU9HrEtPfzQ11l4812mJI03LsNn+Xz9xnika1ypYd43MAVf4Sxt1M8o7Bg3GRFyVIkLkOyEnWkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921437; c=relaxed/simple;
	bh=1BLaPfjKHmQg3VD4Ai6VvT9RwL7KWI71PoSKQ19TnBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D9QWtwBwyU4MCtUHIrYxsF3CkaR6JMULRBvQRr3dLLpUfM+QhBNiNAhFeOY/Lfcjpo/gmkxOni3jZ+BnyEWmmZ69kTLY5xn8UBqrtsLFQIsT2JIuNLIZNewZHqMgn9uN/zntzPwSvMyl5yVaPcbmZ+06hdfNiCQXBwEXbOsXrpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eN5gqedP; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s/Vx608w reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eN5gqedP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s/Vx608w"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNFK0839240
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DxUf1Inj+0dN0yJol6VLGTiaMolAX1qDpicfcIlFfAY=; b=
	eN5gqedPIre92x27IjiyUpvU/S+js9E2skliVtNV3XsiEr4nVQgpnpkprjkpBrzq
	AiCjWDhxeAzEqbwrgEAWV6Xez4R5kzNyuORQPxMbcXni3uP/+HAtu6b5AfA+LkeC
	p0I9EOOS9FKz+3lBiaae8G82rPBdY/G9TrLbcbOWMSOvCs+fxx5x+2cfOy5MbnLo
	WSc4H1eqeAD18DdstIQ3oZNSDbPof+ddO7XZgQWfi1XUtiR/GvvMOm6YF46aT2ao
	gMNW4RenwB5i64fiCPEKTh3KyB4Vp7xIFexyRzq/roEq053bvivJ/vgguD2Kq6r9
	uwfmv/TW8uM4rtSvU1k8ig==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rwbad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:37:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CHIrd6013158
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:37:14 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c8272a2wn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:37:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiaSUGGRrhGhnvMz16hZctHEUs4iHvfuGGpO30B5Nb3PZ+QacdFebJhBpVagyxtnXXtqkzLL5oEHOPRg0Hj52nj/pA66tUomlzaMDwqKp2n6CYfQgDAaDmxXC8NlVIEnCyJTv+JjWmkjmI97L6VxKBkO9O1ScFWphl9rwjjBsgEBBEipaBWqwKGmbvmATbCJZNA3FuD9varH9uAUOiOhWlHFp0JQqTbgjKcdul2nYAUS9Me/bqCdmnVB8+ypk3/aHB8+gxeSaAOzsKa6nmpWgQxpeEKUpEaOKRzC3bo6JC22DtOkmWjPnvL+80lK3PTWy8QUKmADXJsORNOeoHv7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gsDy57xiCDEmemNv6Mx78hm/TSBx61raKTeP3kY4Nw=;
 b=S9vFkQJ0qexnysdO+69jJPwhdnKriCikoZNpfzY2Dbm9CZpEe/xeqJqfBcBOU7InkZGIKGofAoowlQlifJwi/RHQqI27T2NltHezwlYh6BSxvA/HStps6yoJhbPyHlu9peU+4by4guneA6oidXx5YIWHV0XbnJk3apVddGsv/21F/dCEUvsXIrj3ep7JrvDSHmgQ2GnmmFfWKCv4BP+UnhuGp0lUBNO20uHDbGPzyj2e1AfbvMAiTPIwyakWHh/38V8niOREvkG8xzZzUJBZcApKm9yC+ZK5gfO317Yr7W0A658XkSnbT+/ZZsD1vCTu4qyo0WO6bSJ7F1jFZI7yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gsDy57xiCDEmemNv6Mx78hm/TSBx61raKTeP3kY4Nw=;
 b=s/Vx608wmgqKxz6lP5kvJh2rdqVeLSmbaalQQnP/ZL3iMtqv0GS2vw3H3VYdMkjOXVRwdbN4yLuQWR39jkQYqHZvLFSa2xnzIGlsAyZ4xxDpL6usimAcbaHPu24eyiDAH9d9zZSqL+Pbsx7GeIO7921cXg4XOLOlnxUYrKakwDM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ5PPF07759F8B1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:37:08 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:37:08 +0000
Date: Thu, 12 Feb 2026 13:37:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
Message-ID: <aY4d0ttnWiIzwfWu@oracle.com>
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
 <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
 <878qcxomfi.fsf@esperi.org.uk>
 <aY4buJOhWlmm9CvW@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY4buJOhWlmm9CvW@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ5PPF07759F8B1:EE_
X-MS-Office365-Filtering-Correlation-Id: cb624950-4937-49ce-6507-08de6a65ba4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?9ewrZHk8MvBH/wXpp+7+NQjOovhmokzB8pDQuEWorGuvxnoJvHX7cSJwgM?=
 =?iso-8859-1?Q?VOg0ApsANvo3pZZIszcgma65C0xcei6pXcqS+FVODO/qQ3IRniVulVbD+V?=
 =?iso-8859-1?Q?JHdUzZeMLchKGCvH8ye3e/MTnCdTwxcyaA2u0l4pT40hYKEini9+RdKTBF?=
 =?iso-8859-1?Q?3srPJaSqXvQ/6EbhHaavFxoUnC2UpmhREn9F5svXfLa+IQ/uI5d/CGJnDa?=
 =?iso-8859-1?Q?kXUp7395Rl4beMj0L9NHZkWQ7q77KssXCfYpYBDriNqNHtVtwRPu3P/jRB?=
 =?iso-8859-1?Q?EOecS+jKac0PkQ59TxFnl1zKcS12Jykst2dEYOYqnU7Pl8J9xiQBH/67C5?=
 =?iso-8859-1?Q?mCDPNIFHmWHt2gNhd03hAQgYvBmaXcwWPvr3RruAKgh1aq0p9B3YeAty1v?=
 =?iso-8859-1?Q?j97UAksEPDTzxPNcoORXYKrgtRv1ZXjuVpUnzdtT6kk5zt+jN7gZUxjiXL?=
 =?iso-8859-1?Q?HoiLMtdooYwzkpgfXTrB3sJDG6heAJhUzs//Ijp638OJSw6IReYZraogMe?=
 =?iso-8859-1?Q?EvhIkVcbIbrGTH0lVIfVCDiPNkgjD/INMl2k5kQoTvhPcYBRgFbGwbRevw?=
 =?iso-8859-1?Q?HAH+5S/R/FZRyp2KdKjxmn0niFwT0tH4crchlUi5CTaZL7u7OmCDbahD4m?=
 =?iso-8859-1?Q?+43V7xihnbaMpBAvUyd8EjYQnwkVn35x5YBIdn1UMK5bo2zcjlh8YmVfv8?=
 =?iso-8859-1?Q?O1ogeXNiGn8rLzbhMwwXjmMHD0aElFbwQvv5ZrGppLXrfPtlX3GL2b+87J?=
 =?iso-8859-1?Q?x/90MDhD51MQiNDeVblOkBXumN63YndGTXvAb7mh5nHzRp9mRt8YQxz3xS?=
 =?iso-8859-1?Q?4b0gBwGt+46nPv4zJsHScb7J85aGOmNrqREpvRaJ+/zN162sk6uJFKltMF?=
 =?iso-8859-1?Q?q+geWgV7QcKsNaJj15DY/jnuD7TcDu2G16SC+Ry9C3SMCVkmJQvYmXw2DZ?=
 =?iso-8859-1?Q?yXPuSRYqL6z/mxDZqbQZZmL4YHGhsmtvSTYqTTBzka/UMl8sfBty0JTq9D?=
 =?iso-8859-1?Q?58fBizcynu+UhjReLPnayLLAfHtcmJemXQUVccIzja52mWWms7WSY84H7X?=
 =?iso-8859-1?Q?/6n/caAuZNDNVn/FL7jEIhDvUFlicol3DTCcMxW78ETKBhVP6k0V4BXLwm?=
 =?iso-8859-1?Q?6Jf8r5tFEbZEuBz3xnaVfhgKozQhOjNgl5XMBAruyQVH5++Km3LrMbUB0s?=
 =?iso-8859-1?Q?OoeZ202tluXhS+Z5CvVDUSCW2q5QPbx/wfbXCvPXCYIxfPdK+cEbXuny36?=
 =?iso-8859-1?Q?Z5e3w1wWpo7S++4ia8T1Y3XOtiulqIWIvcJ8v+eBEEBCxkf00rBEMn2trH?=
 =?iso-8859-1?Q?UFu8TDLrEZo+yjLnY3ylmeDW3YJ3OdfrzmcOOF4Jk2cOybmAVsJwjn06d0?=
 =?iso-8859-1?Q?U1hs+jH06cOqsW1ka7XiJnXA+vNinf6bsnUnaB6ETA6Eub9f3ZstG3Oby+?=
 =?iso-8859-1?Q?miJIEIom1JvlusBenPkh3mfGydwj+oYHaFB+K4fbhmTHPl41cX+1ldm3Co?=
 =?iso-8859-1?Q?2IjwwJnCbmpn/QeI6ledvBfhNuB2Xsn4YjQ0h5rbx5OzpHVMWsjwpUqXZI?=
 =?iso-8859-1?Q?MePKJb9XcNhhZ8L1jJjN0uSUd8QlMoI2ARruHaxES+fIc/ysIJw4ZO2LQD?=
 =?iso-8859-1?Q?aecV0jlZc4w4A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?IrhC8ss2bYNriA4foD+nzPu6Ztr//xzFpfcEn2f71bxciJSz3itlDQYqO2?=
 =?iso-8859-1?Q?mrtPiPqVMIl8VxvPuhWE+M/rusjRitgDhqloHLON3aL+s+PkO0lR5vGHNk?=
 =?iso-8859-1?Q?+FfHVd1wKXEkbIpgcxEqitbWcu5VOXw9S3KwNv1hXJgy8cwutesfSoJRWe?=
 =?iso-8859-1?Q?4TNi2t3W/nwpY2FjXJPa/wWgRb1xf8yza5pAuj4Eppg8FeVEiD6GpyoTds?=
 =?iso-8859-1?Q?nAsezmcPyECK8SiUgUVTu7HHi+991X7HVdfCuy/p7lNEvLPoWzO2QWc5wz?=
 =?iso-8859-1?Q?AJtgnG2ophyU7yovtWa1Z+Tdl8qlxdxhTSQ5N5IHeiRgOWD/xEUM0HQmwl?=
 =?iso-8859-1?Q?J6MAYgj+YXrjzK3rtse8q6sBU/nklJdcBA4EROJY4LDAtptfTwiutiE8L6?=
 =?iso-8859-1?Q?qbouTMCyLSrvtzqOjOJEtp4gdLJIdnGIE8k7+vosyeDbgRdnliRkWJSSim?=
 =?iso-8859-1?Q?3TH3N6SabwqPY24pwViGi1Jji5wG+SMr3BE2GlJ4AA+NahdphIr9qPARaV?=
 =?iso-8859-1?Q?1/mNgatbKJzGOnVRAeVYth6R7wTYfgifvpVkrHpve4yH/q4u/fbCh0VIuK?=
 =?iso-8859-1?Q?m8hYrK/xPx11z7o/FLlqX9IDtCriP6/5Oh0GARZQ0VFkmkpfkB7oSquTfu?=
 =?iso-8859-1?Q?LAu2mtVV1JkVoXp5AkRqybCusHfnW/LOVRGtAgLV9arAIGGgFYMnuFYSMA?=
 =?iso-8859-1?Q?jP65VD+cTt/xMGIaVNJFAGFx74N1iZT3qzfJsSPOba7Y+BSaAUNJ6IRwZp?=
 =?iso-8859-1?Q?XaFK6JxJYQW9jSZ/cfQ4ktzAwZl3qeyXIZ0ecGpfE0eDUal3G2vv1rkOMu?=
 =?iso-8859-1?Q?gqTS/k1BX0zJ1wwJSOPRpNaQbOxCDXU7S9FpSZGzqJPQVXrl7/MSk8shaX?=
 =?iso-8859-1?Q?fvpDJgfDmypklXxewpTqrJ52pkJTe4snW6ghCrC8e9BX+s4kW0GgYks2eB?=
 =?iso-8859-1?Q?qkcgJZDyw8SKJ4saVWA2q9JsSCVHeRlR8vpTkasDnG4wXco3tK89AjYWWG?=
 =?iso-8859-1?Q?FqKx7V9gVp0JyvboR6VY7mk6dLhE0UpW1sSWAp31bez3YJarsVjMojUb1k?=
 =?iso-8859-1?Q?ZtiRw1+2D8OwA+jJyXyEBcurto2IcsqfYPnKEPPlqkK6skGhnhxuyWFrjm?=
 =?iso-8859-1?Q?Qohu7miQy5S5MO6Y8O3TvXYXyW81ZYAur2h6HmPA0O7GgHS6R0scF/N7AD?=
 =?iso-8859-1?Q?EsmNh+qzouF3kV1Xs6/d00YHXOzddXZqEXrN5DJg39GqXJ7l/55JdNY8yk?=
 =?iso-8859-1?Q?WLGlHDuxXFWiq/1UyTl/evhPlmp+prYBvYNeavbdFh2FgX1sYPDYx9F+iH?=
 =?iso-8859-1?Q?GMonZIYr2FtLLSLe51zO1VE6ChScgElxYrpiPqM9w1MDT81ovBxd0VS6lT?=
 =?iso-8859-1?Q?jrVh/71bZIEOW6CnqfYk3jLaN4Y61wjkN939EfCDOixEHW+Hc8ZeL+7r8b?=
 =?iso-8859-1?Q?ayeJm7fIrjJieA8hgSZnx0+9QMq6q3VbApwArbTHV3TYhwhRtQjQTfxpwr?=
 =?iso-8859-1?Q?fvo4Zc+FrjXVUbXXVIhRg1At/4Y8HP/1Npm9ew9cFKQrPwU85sbPMI8m4c?=
 =?iso-8859-1?Q?0aRljg7XysKZedGnll8lpYEh9W2ZXSuZtsdrLNl+b0Vwhqt4M0VbdBNYqw?=
 =?iso-8859-1?Q?/tRfhOCcng7m6/gpdj9NOjPo6BxCWZDNf+Ps+wOjJoK/x57ojF9BzUcuPz?=
 =?iso-8859-1?Q?5jMOiY4nne1XNveTX38c7+3x+5WsM7bK54kIbx71DPFezo970Q4bXHmb4n?=
 =?iso-8859-1?Q?36uj5jIsFVYt5DM9wp6dW7Ntf1bD7VBdjbcSH+X3S/9kdi2qIHk5T4KDM9?=
 =?iso-8859-1?Q?b+A6SDODww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T4eEZrWC5l08G0dg9zh0F3eYmo93Cpy+V6up46JXALwjayjAOc1eSdwdvZvHU3qCYImoMyeakvfkmq0X03aCZPVVlzBw7YfRmB1pU+uRF1a1Z6e9i3kAhdv+rWSVL/CZnoLOAsYzaRThD8PCbYJXdnMbfDYFqgMSg49FGNcpIHX3/OHU43q4CyWC6Sje1D3XyFHVpjPI6S/Nbrpx4IQJhwxj8WHaKdyNv69EhmrV11gtYd82yB+UcQXmnJy/iIaG9b5ecfiErxkzn2lQ5nYZ3yjwhJkOzxpzCYdIKlcXTHASuio1ldbTGMshpkYdINknWKPC4y0HA14kALjDHR4zZVom+gZDb7PsO62VKMlBntPQ40EiHOWCdK2G/42jLZw1MYftd/AEhF9O7NtZRSSfgjSd6MdxyRN/8i74nfk7MQU1eS5F4rjt8HQ70QmrzOqOlvqIVxapgGFpklgulONGFTXFZr8uk8eFXjJrMKYQt9covbl0y8kAgJqP7TPxFT2Rt7Igw5ArYZXNNqZzF3KKiajdI9JVV4D7tshMXeZ7zkwUfn9SFxOT5Hbq7RN8sOAbV9NvJUMUirZB4zFFVJgCe89tQx+NGnSv8D0y4WeLUJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb624950-4937-49ce-6507-08de6a65ba4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:37:08.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6F1CgNzu7SySq0KQxjDLDpP8ciPyQawo9V6x58H/IsN4rcrHCy6RayLZcca3nri5J+gA1Wm9FlFxeyPoIpmF9TbJUTUacgtGk5xCeZvqsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF07759F8B1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120143
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698e1ddb b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=aIz_Co64duF09TpWQkwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:13697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NCBTYWx0ZWRfX89x+gympYmNv
 j1zg/gNx2Yiw+sxlHSLxvSbBaaiRJylxOrtKx9etj7SlrL43qu6kzGufr4R5Mq9UavYEM9JY624
 ZoAPBRGUqweWw3Wfyv5zPJzYAPUGFZvsZwocVt5rQTNJ5/pGP+OmiGl1yIMR8Yvnl9RTiwflAvy
 vCYIoFPukzjmu4Ziuwf1STOE/F041qpmDYnVmQljxYCWkzePYoQUia3KNt8/XZeKOu/1jpl0wjP
 TR8sh+zj5/mBgIE6QPDMbqo0pcFX1FnNCvTlekcFZDChyCSsB2LOBGTnM1DSkkprTqA57nsbI/4
 EHUVkNH06A7dP2aENw1uz3Gb6CHC3t40sD5oir+0LMNYnOEhTz6IDIXbw4VkGIWjXcxzqmi2GUj
 P56k3gef90Hhgv52UvcwJzkwETrbrA+r+sfszs//prehr9rVq0WIUIsLyBlMZVj1V4Seu5riIWL
 k73v5PdKo/o2Jx6J5BD0MVAD1gKKOqTTp6rmRIO0=
X-Proofpoint-ORIG-GUID: fI0a1zvKFS6YbS4siCWVtjt-i_slWdK8
X-Proofpoint-GUID: fI0a1zvKFS6YbS4siCWVtjt-i_slWdK8

Oh, easy solution.... determine the mod name from prf->prf_mapname like we
did before.  I.e. work with two filenames, one from prf->prf_mapname to get
the module name, and one from Pmap_mapfile_name() to access the mapping data.

On Thu, Feb 12, 2026 at 01:28:08PM -0500, Kris Van Hees via DTrace-devel wrote:
> Here is the problem:
> 
>         prf = mapp->pr_file;
>         if (prf == NULL || (mapp = prf->first_segment) == NULL) { 
>                 fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>                          pid);
>                 goto out;
>         } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>                 fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>                          pid);
>                 goto out;
>         }
>         mod = strrchr(fn, '/');
>         if (mod)
>                 mod++;
>         else
>                 mod = fn;
> 
> Since you changed this to get the mapping filename in map_files, you get a
> name that has the address range as its filename, and since that gets used as
> the module name, you end up with the wrong module name in the probe spec.
> 
> It needs to be the actual filename of the source file that the mapping came
> from.
> 
> On Thu, Feb 12, 2026 at 06:18:25PM +0000, Nick Alcock wrote:
> > On 12 Feb 2026, Eugene Loh outgrape:
> > 
> > > I do not know what went wrong here.  I would have bet big money that I
> > > tested this, but here is what I find now with this patch:
> > 
> > So did I!
> > 
> > > test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
> > > FAIL: expected results differ.
> > > 400000-401000:main:go
> > >
> > > Diff against expected:
> > > --- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
> > > +++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
> > > @@ -1,2 +1,2 @@
> > > -test:main:go
> > > +400000-401000:main:go
> > 
> > This suggests that symbol lookup is failing, which it shouldn't be,
> > because that *too* uses /proc/$pid/map_files, or should.
> > 
> > I clearly need to debug this. Got a system on which it goes wrong?
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
