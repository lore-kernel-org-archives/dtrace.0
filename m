Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A51C6B7
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466773; cv=fail; b=LH8cFhY9rfFjcVzNdnCAEL34f7HrYFnLjDalJ2Yh8cRDaiuKlbXEkXaGv5MsEe1Uc5RPtHfRsJkQYT1MJptaWQhiGzpqF7MChwY4ssBkjVQ9SXwVhAgXyNjcp95g35C+JpTGeBPf0RVqIq0EGGa9FrQU/Mm+/9OiC4Q69rNtj8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466773; c=relaxed/simple;
	bh=/OsOMIdRQM3CWpS+HQqzQHN/pv0oEYVwHh118qC1KqQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=srEEugewy6FdHtBFizTaPxX/B1kLpVt5mt81Uf9CjcAopPP8fk9uOSY3Zo3+yimaMxoMb+h2wmOvpcQt7gmxTO4dXerKj+e7tQSZvTiEl94H0HEm3xqxHkb13B6BizTJ+zQeDc9U8mBWFe/5/qPxap7Cu0P6S9bJZ3aF1YA64fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BOz+hIri; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bmgfGCOi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BOz+hIri";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bmgfGCOi"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMUHo006680
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=iO5KrtP4UFDRFR
	v2F7ITc3NL+4f+q+UV4PEj/CWl3Hc=; b=BOz+hIripPae+cjTfCiMZ2+3qugdHf
	F6Q+2Hd5SM5OWvatVtK5INmQ7W85PtPY7tVt0WPKqoHRgaurlIbSKaw5dC+r90vj
	rtA5wLUAsvFUbcZjPXizgHLqEfaVqzffPuCtXPKLSMzDHGmbHiRG70CJ7mU7ewuD
	cNNlds5WLPamgxaeBO8x49LwraYV6OpVg9Lq94Cpt7EZDeMCZ/9WJS02n64ZGKOD
	E6D67aMwu9IZcxp991k3ywvE4ljztxBnf+5v/jxc8SmDrmDGUDhuQncdUZivTQun
	Ii/2OB7hZFrA+CrborZKFDUvNfBo1I5LPME5NyJIsOfqqtlTNx9OIxSw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8j59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3FDXq037265
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afhd8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJWaDo6ntuI8xwzIyWXy62HjmW5mLZ4RPuH2u4DEqnuwH3rXKjNOc/8769vjZoyuPROHREJItvbAadqJA20YFPjlo8JHEms+DNJapg18lQts+oLzUYZx8cSECfYgbFRPapGRiFyEcaphSnQYLWKlBTw6j1wRoX8++GwlsnayjkeRqb3WIT8UTo7sIeuMu8qxwgXC9VuaBzk+f4VaQal3emehCn+PZOUjfvVuCx9PQFoebjgC9fLRO7EI7WdgjVpNuwZ1wcCOTK59PlOemU4zVtM9yV6b5KDnjVGv/cUji5hZIR6Tb+IxqpBq7TX6WEiu8XTlSGKzys2knU//DMZixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iO5KrtP4UFDRFRv2F7ITc3NL+4f+q+UV4PEj/CWl3Hc=;
 b=D8DEhGfxrVnwb05+9DhFJa0Cq5MhESPgkbQnnQlPSDAMCD6GbsPu8y7IBURAQ5dnQ0dtJ4ecSjD/5wtdvXIkOL0OpMYtm4slCCREW6e99tcwWcN6zu6ZaO7tAg9rshBoKyb2np18Gq2nj841xtpszA5JnApXXVpNIx4kJXzu2iMTFsaOvAPmsBf46Au815Js4GT1I0eXxm/AQID1pbMR97NE7M2+4g11+ISwip3SLGte9SO7L0J0rd9hOjHR2GJaHZEwuabfJPw/i5YCSFnwGWp45xOWrHNHtRQs06OeqDmafcddhaJvxK9vMkPQGEc7GrXKnLaylCgD/W8G7rj5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO5KrtP4UFDRFRv2F7ITc3NL+4f+q+UV4PEj/CWl3Hc=;
 b=bmgfGCOiWUqZY8s+AxOqTa/ZsY48tB5JO0FA4vr+oPXc04FjhAv3I/6YZT/EirfWWc9uReA/zLxshpNIyVEfBg7owmLcbJFmG5tctkaR9XAnZ0GCmNyzkoL3CcUptPPTpxchmDxxOsRvo0x7/2nPOZY5/Jn6DUaPPdbFLI2FUJE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 28/38] Remove unused "next" arg from dt_flowindent()
Date: Thu, 27 Jun 2024 01:38:54 -0400
Message-Id: <20240627053904.21996-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8df22b-a7f0-4d77-afba-08dc966b8116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xm7QFdkhTyogOhF2NWGWlLwFUY6BhHkNfGT5pkGmDEPXBtatXTI1moi++I/b?=
 =?us-ascii?Q?zjS5t7YfNrACMdLRopkiT3mq50uEyWWxCoSXCqM5HTCoeQNvvQInaeJgMeRl?=
 =?us-ascii?Q?pp1CPehclvh5CrPKeKS3LtJpofsme2fKkiqtC9bppdKQUNwQHBUqNIjrrgld?=
 =?us-ascii?Q?uz5LvWAKTc7NWfOcfqzLPMJkf9WCtPh1t5T0ycK646JISSgtTEpOUe8rg7HG?=
 =?us-ascii?Q?W/5Lp9BwJ1dw6KDcnhvJfVYNhqw/wvj6kWBNYudntq+CFeftVvDSoP9FBHMd?=
 =?us-ascii?Q?I195Qevu/Xu4gM7pBl0qXCpBYXykut1+bqszNPSJWs94eKjYSVTovSKKArQ6?=
 =?us-ascii?Q?zR6o0hOXaLYMGjl5cdxNzDbXWgZMi55Qm/mZ4RzPEqbvUqvVQd/HnpE0oq1P?=
 =?us-ascii?Q?VBLnNXXuEyEAF+twXQns+LSBZZPF8q1Oan77Kky34ciIhLa93WFqcqeazuAA?=
 =?us-ascii?Q?gmw4SBNVk4+PxGuIS+mK1u8vaBus/sA8X/YWULR+3MUtEySPBt3OUreaL3cu?=
 =?us-ascii?Q?4loMI69Vj8TImETuclcZ/CX2mDpNvB9g5vM1PCUxiCqtItLWBsDC9iZq0/A1?=
 =?us-ascii?Q?C72/Yc9hWfC0cRjAhRQtZBuijQxtHspodf2+kLCXyu7hQJxdiqz3lExqfB++?=
 =?us-ascii?Q?1as8tvThxxWrpa+TY6b4EjnnpI0wzEMZ2w/vAjZy0doRvLfoe2m5OxhQzjzy?=
 =?us-ascii?Q?/7VFqtDp8hU87DgFyeAbVQPhCHyAZ0Eco5uLshQitAWPNbr2fZOyjKu679eg?=
 =?us-ascii?Q?7ECI1MB3IN5kdjU6r568s5nwVGsrF25JnXN16mmSVZRMdOWpI0OPcVv0M4Jw?=
 =?us-ascii?Q?FlpFopJYQGSkRw/NjQrF3hjQT1weJU2Ukuexa5pK027IoG80VC2CF+NGP0CE?=
 =?us-ascii?Q?j+9rPmOFFraC6TNhIl/BgRb9Utm/MwsajWvA3Vfu61hukeNU0K9tucI/62OA?=
 =?us-ascii?Q?3ew9g9kr/nGzkCuRGA2Mcc+QlYbO+lvyIQNiDUgQ8w9nxzXMA53jqy2MTEyk?=
 =?us-ascii?Q?ESvhDrNizZ7TACZE+BtL44pB0Qm5x3LwBUpqBFz7CgJm6+XOVoo+Pap6DacM?=
 =?us-ascii?Q?vBatABhuf7b5aFQ0MFrp8n9n1Vd7/NHxAUccAnybi+J033Ee1py+9n0z44P5?=
 =?us-ascii?Q?/i+Faja+aLtQ3nX7s9Agr3X2Nh6Ytg1pX9RAPufAdVlOjcMS3xorl6UQxn/K?=
 =?us-ascii?Q?g6/ybsSUeq/8h//UgeBEzFQXfjCvOvp2dhaDY38D5znXrqA4klZrxfMsHhzD?=
 =?us-ascii?Q?7nR1nHCwKc6hSV0rkS+llpq95pAxXdImh25e/HLPWvegFvArp0Rdj4rIPf8i?=
 =?us-ascii?Q?mbJ/PTiuCxccdwSQie4PBEfPaLdRCr+caw9NpLondBZXHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezRCiTolWatFImKPz0rF9krGY9zYYV8iQntu4evpu9njYSBUpGU3yAaceWGV?=
 =?us-ascii?Q?+e84et8kBP/fku+fiMx6womqvx3Ixux4Y+Y6Wn2OzMGhhWyFz6LBTVMlt4if?=
 =?us-ascii?Q?0/Y4v9zyH+iTkvdYZz8CkPkYGO0sTQA9YfNcrzt5CJ/jvIb7AMFOTRKp+vrU?=
 =?us-ascii?Q?GSuvoaMxg1/3lAIHDilejf13yPfZCAGKQ1Q3LjKeQUQRgfbSavOrnKdvuC3U?=
 =?us-ascii?Q?lz/8rJxoxMNszS/NDWG0urbYSf57hKWbZTpi6dxTzjUdZr5E0bEEj9gjD5wA?=
 =?us-ascii?Q?8YQGykWFR0EUu3/UKB928hunn+We6Fh1K62YsD9FWtC2yPTxA4A2swlM/btI?=
 =?us-ascii?Q?vSBHCqowHWxm7SJysy0G0rGh5N/3qgpX0hSb7A2+dCIH9nF2TvIk2opPxnTv?=
 =?us-ascii?Q?N+54XiO5BZnBdYVEQUO+beSmlQqIKY70SxjbPv5waep3kkH4hIAkpuNLO2fz?=
 =?us-ascii?Q?dKUybTaZHFqcq2qqGC2ZHQc5omx/8+Hzfoqy/Ces2QmD1qcA4BYjLnvmEVu1?=
 =?us-ascii?Q?OMZfxykWIetUrn0NGY9LFniAGPFkzkSpS492O9q+Ae4DH+MKbzcHIgzGGphL?=
 =?us-ascii?Q?Ul6/Zu3IzA/AiuATnJ7vv0USb/0siFI0Y4zbBKbbzG3OngT+nPW0jCEaeci8?=
 =?us-ascii?Q?M4JuIntqe8OMLvCWYIsxZy02uUIkpg6VoxcOpds/8Es/bLNPiYdFsneDSRl6?=
 =?us-ascii?Q?ibg1zD2tNKslweTd0EPeptvUFvzHUPsYW3fI3w/ekduiJwIUYK91JbhlHvgy?=
 =?us-ascii?Q?qdy2LOhpFvHQa+eMjFmwxDI60HJGWMVUDZDA4JrVE2RQXHOonKU00R8MhZlW?=
 =?us-ascii?Q?SpqAixeyJJEaQlHP8jLzlKNoHXg1DUnnyTHQVksQq1xNcno9mmyyF/oC9XxY?=
 =?us-ascii?Q?lPF9eZnMrFq3v0PJt20An/BjZDwSN0v6swDdaLTRBuc5m/OzeGXmwqafc+6p?=
 =?us-ascii?Q?Q6N1ReJwEB+c2doM8+H/5CBf5HtoSuX5L7eOUGNM3Qu5OgonITx8smrUDhAc?=
 =?us-ascii?Q?bQV86RuAb3f+moIFe38oHn+tklTbNMC7SWB+IJ3o9czIUpMfi7YTY149l2os?=
 =?us-ascii?Q?jHHJVR6mhcQs/l0lckWaMrI5Xku7sXnemjCqGtEBOEaesKA3AtFDRNRkpGbs?=
 =?us-ascii?Q?V3MQYOl1sPVENH0FIO5jHYjvyqPxV4SeDR8Qz6itubPprpxs9sfQyEhELbhD?=
 =?us-ascii?Q?OrlqE9wI66KkgpzH6+eNuoFIO5q8Yi2EcV/y33UHS9VSXiVrqYDx8zsmnSTr?=
 =?us-ascii?Q?GaFUBrOvH0uiV9EW8ssNJ4l2hZ009R2GQ9GLghAujk5mcHbBT1/m+8xdbmU3?=
 =?us-ascii?Q?2LO/CXMvpMhODM6PCIaGtkYGLtZj2fERtgAvF08bKdsVNVxjzwcH+QwCl2OT?=
 =?us-ascii?Q?4QnmPqiDUBmgoPuRdK+txSk3t1FQ9DNR694YOPtZvfjmfbik6kbFLnsD1Q22?=
 =?us-ascii?Q?a3zLJx3kaZvSvpn0NcQmFPk42vyy5DYRrIxwYYWWTcIuDsBwSinFzwNPe0tr?=
 =?us-ascii?Q?/iRW53gDGh/HMYdz0qi3E/zm08Cah9kXjPg8v3xQVrh9j630Ip98/eIM7Ezv?=
 =?us-ascii?Q?/cvTBbCI1NCy3LNoFsPcOTD34U8ELShMAaxrqrOC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MRqd0278X92itdgRPDF5qGKBLgsp33XAzo3IxPgHu+jelfvKh75uH9gaSj6NfT2X4HLCJZGwDdXiX1Xhbkv7fm+Hh+QaNTRthWzK0pzWktUVqoeh8ZORMQmpwfZpNSQ5SQ1IsY4OyYewyxOIDW5k5G1OFcAGso1Q5/wGdGwivmS5S9eW0UiTWc7VJGJPgn50Cawk8GJCFrlZgmjs+UdLezwGnmgIdgPP2vH65+6hrVzCZrj2AhEGeSmlKyd72Lub2apry7MdUlw+oGzkTpr/8isycB6M1JGGNdYr3P823AqVbNmVoosRlbRnNPG1GnpCIZs8oj0cNM5guPKA4RO8xjfa/qt+sroC1wJpnBITQLhpXCmVEErzjKyH0qZev6XYKfm59DoQb0qurdqTfwsvIvRVtFF4o9H8X5NzolBI9KEMPIRWpv/khgSDx+8DfjNl3ijkPmgtHC9ljOxiVF7/TzN3jilnvDm2Zll7acK0Pzvm0nkQFNs0tLJGm/EzN924x9uGUkWKVz+O0g195BgQtbezAT4W0A90GS7pJNC5oWkaJhWMwrSvwnAp0YKYdi9XNFeu+Ada3ka8B/Q6jAjwI+XlGIo0myypDa+5OXw3rWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8df22b-a7f0-4d77-afba-08dc966b8116
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:25.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcWWpIYkIHSRSHXA/HuhxJ10yndQt7312e8j/DBK5rw1GkfczIV30kaERYsMFvLMNpQIuhnADu3moh0agr8TMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: h5yoeg6MPDnVSLisGMwOV3jPj7WdKBLH
X-Proofpoint-ORIG-GUID: h5yoeg6MPDnVSLisGMwOV3jPj7WdKBLH

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 5fb636fe..7dfec72f 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -432,11 +432,9 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
 };
 
 static int
-dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
-	      dtrace_epid_t next)
+dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 {
-	dtrace_probedesc_t	*pd = data->dtpda_pdesc, *npd;
-	dtrace_datadesc_t	*ndd;
+	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
 	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
 	const char		*p = pd->prv;
 	const char		*n = pd->prb;
@@ -447,7 +445,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
 	static const char	*ent = "entry", *ret = "return";
 	static int		entlen = 0, retlen = 0;
 	dtrace_epid_t		id = data->dtpda_epid;
-	int			rval;
 
 	if (entlen == 0) {
 		assert(retlen == 0);
@@ -485,21 +482,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
 			flow = DTRACEFLOW_NONE;
 	}
 
-	/*
-	 * If we're going to unindent this, it's more difficult to see if
-	 * we don't actually want to unindent it -- we need to look at the
-	 * _next_ EPID.
-	 */
-	if (flow == DTRACEFLOW_RETURN && next != DTRACE_EPIDNONE &&
-	    next != id) {
-		rval = dt_epid_lookup(dtp, next, &ndd, &npd);
-		if (rval != 0)
-			return rval;
-
-		if (npd->id == pd->id)
-			flow = DTRACEFLOW_NONE;
-	}
-
 	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
 		data->dtpda_prefix = str;
 	else
@@ -2343,7 +2325,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 
 	if (data_recording) {
 		if (flow)
-			dt_flowindent(dtp, pdat, *last, DTRACE_EPIDNONE);
+			dt_flowindent(dtp, pdat, *last);
 
 		rval = (*efunc)(pdat, arg);
 
-- 
2.18.4

