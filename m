Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1608613C695
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732136013; cv=fail; b=FWlsyZFf2xtyyU58kyhVIv/qSOzU1gJH1hf54Uy6ihD6WvBu1lN9TXOBfrWUBVsLPpgqzleFwbYq4DaqzFShb0MXk13M1gWEw2plNoSK753nQQR+uA4kKLlQ/IOehK4A0X5Qg8/mkwam/6DFyltlJbWeoa3wnCZkyyRquEPlf/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732136013; c=relaxed/simple;
	bh=TmElsuPgZtqNMP966CP6XplJtuv5BRc/THDUTPxap7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gLZoW2zN3pDdcsk+Wd92GdTNThExLoRQvHcMw2D7/jWefVxOWEB2zdMvlygnOWtPwwYs/8RCSPdiz7cRMjrRaKTdG9NWZu9RWc1YrwDxmby+vydKfbu67atz1rPcYKMlOpqoIN83RDj0IfLwTzrzPlYEd4VCx5TMfoLLyC3gKlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wxz+Bu9P; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WFfy+y/N reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wxz+Bu9P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WFfy+y/N"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKMYWT024535
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/uNwNlHXqkwuRrqP7K/w2iSoCiuBoup3mSsZJNYy1AA=; b=
	Wxz+Bu9Pjd7YwEOOKEaSojMQhE65Q/wAWV6D06uy6ZJhLOPFtnBXWO/YS7I5icnI
	KMnR9phOYzgCC5KUBQSFBNQqd4ijFBmtlpw55HJKyN6pmuK773gLUjIur7jrPg8o
	f2yhHGGu3otGhB5yCH9EHyRCTuHKG7ugf7Kcb4ovc6w8UtheIpNyiDhbiBCtD4oA
	S+B9Yyop7PEkVygXzaea7dNf0NfJvaTm7/ELZuPvwkHDvLpWfPCrgH908X+DsdnM
	uJZisv9wmoHvjdFvjqKs/BJkGxANvXVIH3fQJYIVwSxyR1xQpD/UnFsquRhBM+zj
	rCYRMSHyJuIymMGcy+b6cQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xkec0efu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:53:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKaluA023063
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:53:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhub5puj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+bgxmN78lOktwbpfvYHCTNE5GTU7JfOzpqLALcAFSOXyaWTt/CU8qlFwB73IcaPdpWJJTW1g/MmyKOnH7qhZx9wj/vAajIsiVDc8dTWGKsCQF7F5rq/PsF95gjXK7Hsr3tObRmehbtQB1f7tf0oDt8r89B4g3yuBkNzGXYeH3VSFI+TfznCt2PMBkEGjMoLGe1ldCKP3WmVCQhRprIPGtrUxhoB+QVCgaaFBCP7Q9ER94bGsxoU8P7b4tgRyyvWTtl+noljjFEsgPBfIRZgYKINh/pw6+refbmYxjippr4WYBQkAmARTqkW5w2Jvk9i7N9mFL1jP2J6sTHBGBPyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuSUvqTXd8UD6qG/afmpCjKMUwDxc8xjXo7RlfQMZ1M=;
 b=KosmvjL+oiB1Jd9Rnzf33H/3zrs56B6OOMl/a5EZmWga2t2zR/j5FvmXSJJW2dntRcG6ZUEnolGqLVuyTYS9AOzX+0IEkmTev2zC2Vqis6l7cJgyLdHjLxALUPiyXyp945D2cwrKMuAX2RXF7Mnf/6lEzW2VUrvJuf8vF9AU73W4qIagnN3SvIwM76MMrgpSDwxpM9cZcQN9DapgC2VjPD8xNDx6xQ0oSHmDknshDCYGqGrK6T5UafHkITxcOQC823fDqunPH4J9PzPsmjG01LU8qBMDiBtAiEX3WR2WO20/0ReOs/N6plFVBekCD2JQPB2ZDSZBcrd2/iI+pnnYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuSUvqTXd8UD6qG/afmpCjKMUwDxc8xjXo7RlfQMZ1M=;
 b=WFfy+y/Nep+urOCwEDqtMWCazbZEoGmqE4DxIzegpt2KStBFx3HFcwX/RH6prQscY2hj2ZM/GO7uAHj+rM2//dcPMXbjoMzumtR19r4xoewHJ6zeas0MOumu8Dj1A/GGWKj6aW38ohIGnzcNQEoiTa4pjYPcNqwDQ/bnr2w5Ufs=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by PH7PR10MB6555.namprd10.prod.outlook.com (2603:10b6:510:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 20:53:26 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 20:53:26 +0000
Date: Wed, 20 Nov 2024 15:53:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: stack_fbt
Message-ID: <Zz5MQ//csgBrKzmg@oracle.com>
References: <20241107232841.28752-1-eugene.loh@oracle.com>
 <Zz43EAAB87FOttWG@oracle.com>
 <Zz46wQyI22cZMdFU@oracle.com>
 <169ad5fa-885b-8127-d1a6-b986e1d208b0@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169ad5fa-885b-8127-d1a6-b986e1d208b0@oracle.com>
X-ClientProxiedBy: BL1PR13CA0439.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::24) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|PH7PR10MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a92a6c-6877-46ef-d0c8-08dd09a56127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xnjR2s1F55GkyFNroYjkMwe3L/TgRDqUZ7cFTmjsco9fHyCQKLpVNKTDqy?=
 =?iso-8859-1?Q?NORtULoM0AWntmyfV03+oyHc80ELXr3WzCtANHhgeXsjc1yVNAgWhOFKKr?=
 =?iso-8859-1?Q?opoYIqZiLfqvqWbMnolkc/NPnwU1w9cduR5aiHcn892BdZRA6Q2ZjzVFil?=
 =?iso-8859-1?Q?ldM++rEx1XM5t0pcBSFZMWY16eJKyjdJr1sQys4Y8jZ8mSHR0SPHBsF1O1?=
 =?iso-8859-1?Q?K1zIrAEG3TUj8+Cs3JB2WHR4tgGHEFXbM8nC3JREP2Ph3tzYsHqfOgRhLG?=
 =?iso-8859-1?Q?mDWvYY/vRV1M8m+myWb0LLT//F8UtdP+DLnsHMiF96M/d7Uhfx2OfG6WJS?=
 =?iso-8859-1?Q?M3rdVYOONPgs79LHyiOVJKc4OpbMyR/1eyJntPA/K4HvgRq96ahUHRHt+m?=
 =?iso-8859-1?Q?ASaCU15F26lDjh+GkAXK0Nu2GqgV+edKgyaBPl4cKt/SjxzxSuetFdfjuH?=
 =?iso-8859-1?Q?Y8Qsv5HbxQ3V6fNRrqeGY2n4USklPnM42g/5cK7xYvzNbp8OK2XksdEka9?=
 =?iso-8859-1?Q?hNnAFRaYA2crPepFVU6d5cMgUtuapIl0dl6Ayy3o57YEKhQ3+Y1Ctak9mO?=
 =?iso-8859-1?Q?OvS6YEVNIpUcsjZFqQcP1YMw2G7oK7zvw67KwpwPp5iewLqocHt1w9Ig7F?=
 =?iso-8859-1?Q?RUG8o/0IFaGY0JqxzNtkzk0PLm8UV4XVs0WzFhUCpP/uKNz4Bn1COczmVL?=
 =?iso-8859-1?Q?IKePavvFfxmtLWDUVPF9rDyshngfeghWFtfxaegsOCCk/o9gYzJWoaWO/G?=
 =?iso-8859-1?Q?0sKIrK2cOr1e0NF8YDS2ynPZjYKDhu4owgPPX2/akOMeL3NVT4Ch3soJ9N?=
 =?iso-8859-1?Q?0vH6jShcgWqMoh2Vh99YKVQy/HETuS7NkYQ+f4SQ/Yzjzfw3+AN3/DN8vB?=
 =?iso-8859-1?Q?cBWtM/E0U3N1g0P+T17rBinU9HR/bXVerW08/SctxrXkcQNl1LoXTAdlmB?=
 =?iso-8859-1?Q?qLHTu8e+rHyPNNxbrhmaIK87/ov+sNe/j7AG1DWoV1tuxrfHzUPEFiaYVE?=
 =?iso-8859-1?Q?A04RFPda5CW4vzkyZwJHL1YzedYQls5hrQqDaU5VYUsZUs6OWJ8UjSHOiF?=
 =?iso-8859-1?Q?BdT73nKQRbVI74WhaMikOOeovgat6WqpsspGwFl5JN+PFupBISAgGGRDBw?=
 =?iso-8859-1?Q?mB6baqF/JcdP5VoV4vkAP3WvVw1f7mZ0GcedALBI5O4GqH/SeMTiGqx68h?=
 =?iso-8859-1?Q?Tx6vdkEytLA4/PCjRNZGXjt6PkZtdcbRjtmBBTHEUeFQJLkEvjTabDLbRa?=
 =?iso-8859-1?Q?/X3+wMMSb8hvkEQTIyOPlKwAhXDhGiWOofIoAQeTvYK5LFud9XcWJEoGax?=
 =?iso-8859-1?Q?gYRhsKkQrKgA+jb/FCqI8yJcCxJOKDKWrUqf1x2Mhc86jvo13/Nov7VKgA?=
 =?iso-8859-1?Q?8UkNXTnqoS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Z2Q2C3h38lWWBNHmmHrW7N/MkNlE4AYekbhJmkWXZ87UsPck5JaQY0nkV5?=
 =?iso-8859-1?Q?fZu+flTXtouLBzYSI8ZRqaJRRQzabp0Rh7KAXqN9QH0gN0HJMpNkNHEStK?=
 =?iso-8859-1?Q?vcypZ56x/Msh6pttk4MAuMU5i7yfbi2SBYizlqzcmyFR0EHJodiNmTw/gv?=
 =?iso-8859-1?Q?T89AhDPY1jplpXAcO5vBGlhsfLEt3GH+Mvgr7M94ASb8EQtMALx4JGURMO?=
 =?iso-8859-1?Q?BPa7yrEBaZ52ZISX+bkkNG4bdge4ejJobkK1SypEv/Ph/GnN7dq8CiKedj?=
 =?iso-8859-1?Q?+LeKmDMWylyMpAFlYnVvGSHs+RFB3DG+uxeMawiRx9R9dHv8yhU3HSj17V?=
 =?iso-8859-1?Q?52SngfV6do3ncvAcQGv1dX2AywTnmz/AjmiTtzguVRrYF5BcEgGg2IEYFN?=
 =?iso-8859-1?Q?lul+PkSAgVwESDtH7qVSqR4cKcRw7STC/y4xKXjfSV0/FpGiSQhJHGDpZf?=
 =?iso-8859-1?Q?znYdn2L03X9gFmkLmt7StO4FDaEVdOR9X9diKrBPwBEa4MHUqnAEbGMLFt?=
 =?iso-8859-1?Q?875XpsrQ6i2raLiywCwYCPcDW8Z/eZ+ZosZwf1SwyhuLunMMzZJDbiTsWF?=
 =?iso-8859-1?Q?xNM8dh6x0haNPV7oep9cEn9cGd30V7YBDtdskFiSqWiaD9KrNLA6ATsETl?=
 =?iso-8859-1?Q?9TGVyjttzO27K4vOVJkmeXwYycBkrYgY9BMB/xc1t3Ht5Y9OQT4svN92r3?=
 =?iso-8859-1?Q?6RPov3RO7JJyJaKILKk6zdBcJ/Fz3pZfMnRyvoD176fsj5XL6BPveLW8Kk?=
 =?iso-8859-1?Q?CfNjj0Vioe2wjJ4DntL8dsitm7lkyxFsnxKhW3k1hbpkqGAo4YAffQyeVx?=
 =?iso-8859-1?Q?J1IJRDLav39B54FwdCvezhZPIUYT39PX+oujbyArS/jRC1ZjBOZAv6RJce?=
 =?iso-8859-1?Q?1ck4kTqj0ijUGBEnsCwMu2sqOw6GgF//NOtJSPJmGJ9H0AfzUJXzCjshvt?=
 =?iso-8859-1?Q?uJmk7XnWcBHgYt6h3jXp2G1K+fO5wvH1Oy+g0579ape9faOprytRKsUiGV?=
 =?iso-8859-1?Q?cOjL0RkfBGFzNrFWP2SO5iYaOlUhEVnh+Q/3BrPEazSGxjcQnry3vDBU7/?=
 =?iso-8859-1?Q?oVddQhQFCD1+6W4tCWEsaGu1tAlc3PBECDBe1Si+CsoM2UH1HwYK22VEP4?=
 =?iso-8859-1?Q?zN1XId5WGOlcO6oGUsZr4Mo0D6TJNPdm0mVTj76WPKHNXyAZFIze80ydmh?=
 =?iso-8859-1?Q?tsbyDyo+zpX8xHnvnw25ZOFaoARO9BBEjMuc+DOFgjAnKBNaI+4mVOaRMr?=
 =?iso-8859-1?Q?AvaTL9ZVT+F1Az09A9jtQpsCr7ssbARKG/zif1e68XyZIg+QIIznR3A5OQ?=
 =?iso-8859-1?Q?UMS1gKeLvrYvrVd80D+5ZkID2LKC3lml4jmT7TWN0625EI3DMLkIo+jeFu?=
 =?iso-8859-1?Q?OF9b6i+nt0DWbkOdLVWO9eD2lzBBAwtwwbPy9nauGy4kHukN2swtpW0GRU?=
 =?iso-8859-1?Q?ztUzmJjumtpJmE7HDeFlquAj2p1pU8acgoDuh1zhIeelASmwFnlGYDwk4P?=
 =?iso-8859-1?Q?OLQJaFVkFEcPzvZCbpaINtI1q4eE15PLluGKzYiHidDPBR+i2vdollyfSl?=
 =?iso-8859-1?Q?69Ezvr7MKvgKaldrFQDNrqSxA80DvfM68KHHAgTuz84PewGr8OZCBg8oRo?=
 =?iso-8859-1?Q?VWZEXy8kOIB2U8l9LRhmt1FQQqidIjZg82/EKW/ulD/Wb5NY6uKqG00g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l4QC7d2ZgYcPVgHVNOha98KbRUnHkuZMKegNG8+9qWQmdErZa2o9PRqiALmBtq2KcUn1AxxvHFOAGuMaygWn+hcGD76d01fLnHz8j36H5F/IMZT/r5SChbHrg23K5wqIvtcOFL91lXitPwsX3cjbLVNCNeITKueL0QNGitqQYchkIkn3+9Wjt5K0UkBnKo0y/Chu9q4XkeDqKEgUBe8iorqg9h/xxIwpJk78XyXRohAzc+IZWzD7O6RqKh6HGZQgHbU/YjmDcEeWoNN5YuKinhod89LkNnzxZjjlrggqcWVLtY8RaEMh+Ze9s5pw3X/DyHdg7Ji/Jft2ez0IIw1PCTCkmu1wi1SAIhuMS8rFAfv28UcoHP9vlLA1XZWq1pl83rPmxh3nZ9cvLz7BiUA3Q4/n5a0XDt8doRuAWntnvdpa6DTbS5JL+GxUd64ab2S7ZtYwwv24YdWVMtdCnjab2d3IdZAYTtYR83wOj/xnoe/OK1LvL79tae0pAK5pRC9NDJgjZ6z7CsTlg7xdIvUHAdWr8SnNzDBYAvHwgGYQ7wy4y1a58RQPK3Pmp+kJ5wjLlCagD9+yiK9h7aBul2HlZKra7lPdxFMZGZwnad+ETZI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a92a6c-6877-46ef-d0c8-08dd09a56127
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 20:53:26.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdO5Njv+LqvMhYoZvG3+esNm5YP0K8BmjWsnGapdoLxk8SxxYUoiqQEqKH7gEsbOEdS9W961R3hRWBkJiVE5t0DvuZ8H2YxbPJV0flhUcp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6555
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_17,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411200147
X-Proofpoint-GUID: sev9IJckZalFIG2ewT5bF0Rap9qsEnaT
X-Proofpoint-ORIG-GUID: sev9IJckZalFIG2ewT5bF0Rap9qsEnaT

On Wed, Nov 20, 2024 at 03:39:34PM -0500, Eugene Loh wrote:
> On 11/20/24 14:38, Kris Van Hees wrote:
> 
> > On Wed, Nov 20, 2024 at 02:22:56PM -0500, Kris Van Hees wrote:
> > > On Thu, Nov 07, 2024 at 06:28:41PM -0500, eugene.loh--- via DTrace-devel wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > 
> > > ... with small changes as shown below.
> > Also...  the full stack output comparison is riddled with issues because the
> > low level entry point handling for syscalls is an atrea that has changed a
> > lot and still changes.  E.g. this test fails now on a 6.8.8 upstream kernel
> > because of the following difference:
> > 
> > <               vmlinux`entry_SYSCALL_64+{ptr}
> > ---
> > >                vmlinux`entry_SYSCALL_64_after_hwframe+{ptr}
> > Maybe it would be better to not bother trying to test the full stack trace
> > because it is bound to keep changing and we'll keep needing to update the
> > test to deal with various kernel versions.  After all, we do need to be able
> > to pass tests with upstream kernels also.
> 
> Maybe.  Or we just bite the bullet and add more cases as they become
> needed.  After all, there is a framework here for being able to add new
> cases in the future.  There is the usual tension between simpler tests and
> more rigorous testing.

Yes, my challenge right now is that I really do not want to try this test on
a large variety of kernel versions to ensure that we cover the "most likely
cases" of kernels people might be wanting to use (and test) DTrace on.  That
is a recipe for fa massive headache.
