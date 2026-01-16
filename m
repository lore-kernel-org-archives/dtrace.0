Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57B2DBF47
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577592; cv=fail; b=ekIGifkYJBLVkdKPaIaDVZaxX+bbgFMUbMFqWNnrWGa8GPo6xUdo3lY9cQTda03Jc3/FsE7U0G5musQ1kR2b34cPmvqmYQfe0a8Cj/dj5bwVlxwKGoW3OVWc1q4A4WBIWDPR9CAE8SX6qo17w7zl6AJuXU/3vuE35mkV8Bt3vyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577592; c=relaxed/simple;
	bh=rLbGG6gZFMzY5rVn+XhalBR0Q6oDcljrDur+sqrQCMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nwq9tsC0kik+z0ldAJgoglqJt3m/sPhq7yG6dYakPHxom1RwbB5WLWwKar70zi0EbciibBIAhguk9VmggsZxCSPWBYY/2RLwaRMtvG2KYw6aVfzD2EF+cjxQL+P1INU9N3+mIpCSAZgsoivxLSNxcWUTBsTBcpvg0/OxTg81Fh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m0Q4YNmG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cc3f8Odf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m0Q4YNmG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cc3f8Odf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GD9xSJ1431563
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3MS028t9Ck2WGLCa78
	C2hVGFI1qA7Ye7JQt4dhlcnbc=; b=m0Q4YNmGVlWc+jD+CdLnsFWyHoSQXJV/lb
	55pn3STv/UqIE8dEcjH4d557+LO2ijQbY16/JvCnzzaxviqAnPwgQueI1Q4j/2X8
	SRw5gOrFDytnhTpmat2ZleDbNHpnrL2fzj5X+59p6NWVcQGjll24AObeHeJBg0Tq
	LfiOUguVxYSb8a2sdXtLFAYDezS4n/sPKYFwq+dvugGGFnVy/ixh+mjd19kH+Ezp
	nBtwqYmTbxlf8c/wl03UDq/NKjH6/mUEaJwYmCplF7C5Ze2guXfU3FjwzRPtEhPE
	SHOO9+9ngA3c/qkC3ex5oJRJWrUnKoI09E+N0yLR8FDSPYc2GgKg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq5a43a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:33:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GDO22m001838
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:33:08 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7d0xag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGyFxcpLcC8pZ7sS2+W34AtpgfDiJszCIu7WyEpZ5VIq3nt+PHcoSYmEMmY6/wwZgy2VtFPiNFCnQhmlPF5N8VLmX6RtrnBScR6zzUZkuHhZvtfVvibToLvSO/RhKpyYHYSFZUTkAQ494bDc1a4teQj4udxA2uWvasmYkaMHIhKoAYi7bk67N9uZCW9kBdp3X0TM6OEV6iSXWriifMKnfJ84hqaLivCxvwl/oO7jV9z1E0U3jUhFBIL4r0eSuxxO4DqyRM4R4yV23TALA11XDIEFOQ67n4lVCt490a8hzhHw9BX3tZ/jac2oXT/kQnQchD0rFt06d/lfMomqvqRHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MS028t9Ck2WGLCa78C2hVGFI1qA7Ye7JQt4dhlcnbc=;
 b=TFdIiDEnmVNIhESbrE3ZpDSbqNEFdVGDHznSB6IZBpBikgmkq307JZnRlx4Q0PemZSMr28TqHN/EBNswQ3yMXngx+za6q2NzeSVCH3gSCIYqKqpMRa0ATmYdNoHv1bV384PjELewchGQ/rhUP5AwAtS3dmpsYCSUUUIu5UadRHMhiApay3cW4M+7m0hitljBFkddDwEOj8i4Abe8rdJ0yoSCezlz5rSO7+BFe7Nl8+GFElVmya7H9Gw/kmR6jhroCC4vaLPXmmdnZgflVTAb5YK+WC82Z7Hz7mqOtwPK7QjmBt1HXSBvjgoHZiXgMkg3cItPcbybjjkLb7N9wE02ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MS028t9Ck2WGLCa78C2hVGFI1qA7Ye7JQt4dhlcnbc=;
 b=cc3f8OdfbkYFxrZqD+ZUM5rN9Rk315UKF/D0s+yQuWtGKEKP7A9q5G/rwPlpRVOVnXl5ewmt2fhxbm1lpt4lnKWxOxeOjuuJT0y7Cq/NbAvdsnYxLNHSGXr1ptQjSad+FdryZ4vNBpZaWVQI+bnSgeaheyz7hZSTlpFI+RWwbTo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6228.namprd10.prod.outlook.com (2603:10b6:510:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Fri, 16 Jan
 2026 15:33:04 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 15:33:04 +0000
Date: Fri, 16 Jan 2026 10:33:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
Message-ID: <aWpaLckFtfY9uUPK@kvh-deb-bpf.us.oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
 <b1973c8b-09bb-4528-9339-28110b48976f@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1973c8b-09bb-4528-9339-28110b48976f@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: f59b8178-6b9f-4ac5-3df9-08de55148a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BV6QTMlkJy8roDr5K2RFqCW7oG543pn0QJiRzwDq0NlaPbzS35Fq1qVzlsnc?=
 =?us-ascii?Q?2VNwJ+v/DK1AQWRVEsTD9PjKxOUQXb17coc1pDABsVZ6EPlKiDwNfFfjbDt1?=
 =?us-ascii?Q?Mx9Zl+Pra/OxVKlAB+JGTlVFe9i63bRfk/G0fDo1x6B/nvT3IuhpJ0so7DMR?=
 =?us-ascii?Q?26kpXFZ1tEcgLUCLMkFo7IaFijT4WQruOwQSV3xJ/VoRiuK3OBm0IxOS9w1W?=
 =?us-ascii?Q?azcBo+zbHee6kSLvK7e7I6YSmjhm0/dUG0W7BtmSAv7EkTENpACYgtWWajli?=
 =?us-ascii?Q?syOMH96tG1uxzhGSwpMpmF9cnSeirrcqD4hczzOUBVE0ZqZoKeZ3WqHnhtxA?=
 =?us-ascii?Q?dkp9LLdCAEM8qUEavZ7+mey9Xo9YqR9f/S0MyixImRYSl7/dNAgFqG0X1ONC?=
 =?us-ascii?Q?orjZtgZc3u7zTD0FSdlj8wi1/WPdU3MZPlcaoGg3xAeVAnpRqM2MeTqNT4M3?=
 =?us-ascii?Q?ZW9jSu907Rea0Kk2NmYz3CpU8dQXysd19ug4LnIod2VLVvum7bnbiJLmeOXf?=
 =?us-ascii?Q?xjUgAkkXGW9HVdNW679aXyL/CP2vagW/H4TGw2/evP+QCMjgwITokg0ZG/O0?=
 =?us-ascii?Q?ghQhUonjx7k2k8S+qqzlhdxWnRslYpUIN2S/9nUxyr46G+zKxgwqUbIL6VOx?=
 =?us-ascii?Q?dbN6RGCpAL8hbZU7eNZGgIz80ccIFZDFyqutBWLwAMCf/AXQIzhFN1DJXcjF?=
 =?us-ascii?Q?nTlzOp6EzxQEZ8jV3yN2fa94YUhVfPfyd7Lj9zDyTuAzfm/KsVGusvrvY1ME?=
 =?us-ascii?Q?pv1+UQn5xFexSqr8VKpnMXfmBB+F7L6RXeThGCXng1rrCX6oDFhiHgK3o4l/?=
 =?us-ascii?Q?j0blRQ58rGlC53SZaPvV/G8fKtA6QgUuQsmzKd02NDxASoMq9Q4NCH4dLKWU?=
 =?us-ascii?Q?O/bxqkGnL16Cv6+E0s3YgZlgh9CUorwQfYHLW8OYmfDlAjjB6EBlBLwAqfPi?=
 =?us-ascii?Q?HBlcW1UOteFM/qIfZ0/T9H8GFISHs6OclFO6qz/5CvHeGmIcoqYv0Nr9Jlue?=
 =?us-ascii?Q?z0sJsmqjgYE6pUD5/OxluYu81OGXe12MEtfRH7z5yz5vT9CKHUr9sFQoWhJY?=
 =?us-ascii?Q?4CSJUXo0J8571agb7haCQUwH8dTUVFD7avGDeG2THfQJbq2l08sNVwWLtQbx?=
 =?us-ascii?Q?WdhhnzqCZNG15Pxmak9pR1Atzy1lDvhZGP6HGLPj1iJkbzTEPW+B3Be5piBL?=
 =?us-ascii?Q?O1SbfDfKUzPFrNjVDKToXA/1QzKCq5FijihfdF07z9F6U9Nz+oWTf5OUotMR?=
 =?us-ascii?Q?nAts7e7ztXQtdqd2nOChBXxyWeeJJ+cnNGf20uMAHUeCpF4/Gwxq0FuwsEDI?=
 =?us-ascii?Q?Ly6clTEpbYMz0YtfmIwZdpg3UM5drp+DuOkiqTjBUVj99KCTTX8q56Ek7OpP?=
 =?us-ascii?Q?dU15xpxCS620IhYdr2uPKWmrRO9ovnyX3NvKS//FxI7vVMtJWALLl9+CAkm5?=
 =?us-ascii?Q?0h138XEC8nxNwcMdm6UTrhQpPB8qko492o1PwTfmNgpCf9vEQQt82Qmxmdd5?=
 =?us-ascii?Q?stegDKut9Xoayuix7xswfVsewNL7wBbjDBiYbj8qbVsr9YX/MJM6b2SFDoDl?=
 =?us-ascii?Q?FpdlUfePy2wzF0fEXHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?13NtMiSXrEop5Ja14uG6Jb3VCplrzILncPnyp6tZ7wiX6LaIUSZerL1ghy1y?=
 =?us-ascii?Q?twXHQBZFYzfMFURZRDu1w3fcRL12Ni4M44RJBRgfxBTnniqOVMnMJCw2sRpQ?=
 =?us-ascii?Q?6MFi7IlbhpR9cdy+5XzZXeqiw0M2cO04bWlG8UpENWpdU2ewVKtgfjw+g+iP?=
 =?us-ascii?Q?MP5d62ASYm1uv6R6uu1PfAiCnuCxX9iLWLSXrq553jHnGDu6+xPRi/bJSAS/?=
 =?us-ascii?Q?fSmYynN9nuHjd9LvLhGTueVjJdYuUzZRarEEI6f0QuSC84mYlf/TFF7fe/K3?=
 =?us-ascii?Q?eNBBVLqyCNYZjC2dHEVDvaxq0EypzbmDKoLxIg+HHBygxVT/rwKAmWfcApaD?=
 =?us-ascii?Q?NQ8sowf+dNwvOh6HenqrLbrL+eenR6/K7C8Atq5u25BUBlezkYdPDUrbWaN3?=
 =?us-ascii?Q?5aB9Tb/34GrEPigAEKpZFIWLd4hy1HnC14jL/J+Rj78bodpiFL6apJzuXhaN?=
 =?us-ascii?Q?NDayEjgyGWBR7VMChsuio/GwpXWRd2anle6FIaASVhSBEqYIRYoYFJX7Oc1S?=
 =?us-ascii?Q?KWnldCX/pCJHBcFMHYVFgWN0b9zjbSdycwjFpB5piFTDc0h7e6IhuSq6LjS8?=
 =?us-ascii?Q?56CY5OyoFODrVTllDQ060d13ArUTvvQ+VtzKTwaUwje7FpD1SpPyG+m7MFve?=
 =?us-ascii?Q?5Lt4Z/9DhfT4fbiJABt4OgK2uc//F7Sh1jX2bSmRaw/79Cz/BUDorkePdZlx?=
 =?us-ascii?Q?1iNbLEbFfDRalKf+r9J6UJcjJLZRRpjmsHX5y9ng5JJyYnpwMPyDMe3S4vMU?=
 =?us-ascii?Q?rZ+x8GN+Ljf8hoeL9zcbon+kEVAibRVVMVt5RiXOFdVsWAJxrZkT3t+riB2a?=
 =?us-ascii?Q?JR5rx+RfOoPqviq8RVAX97sr1Um5RMRNpJ/DSPxsS19E/BfgmoFP5lcHiXbw?=
 =?us-ascii?Q?EndAF8fEoM/F/T6domvIohixjLcrU++Xo6JUdBzyqA3UgH7/Uug5w3pHE747?=
 =?us-ascii?Q?kamByXdjlmWpVRxrc/oiST3UpcjZUc2D8V9XhUtSK44rrNhhIH+ZzyHZwmjZ?=
 =?us-ascii?Q?1Z+7ktSYXdN6pkHpaLfPY2tK+npny/B4QE8MqtsumxLs49IgMJdrDAdbPnWf?=
 =?us-ascii?Q?eTMoecfAS5YdYVxcGCsXer0EZaWKEgXYg4C9NZPCiP3cbChs/s/sjcIUKTfH?=
 =?us-ascii?Q?WMl8v+hRY676WvtCtynuyoyLk4bCdZye6WfORHtHJg/CzE8UOGyQEP+K/kOo?=
 =?us-ascii?Q?9KuAKj4gkEAYumTKCZp+PYMt+UgZFDbmnqdlgVndRpZPBUllNaa2jjRR4TgV?=
 =?us-ascii?Q?b+s1+mOqKpoijZVQ2AG8Z5aj6Bo90W71gEKsk+eGOxY9bqaDwW7L7ilbbCFN?=
 =?us-ascii?Q?nsUQgOLNY7mFlHtUoezAorZ+nWaNWcgCy3IEvYPd1ScJw7SxXL9cHh1288O5?=
 =?us-ascii?Q?9ks64NRnggKdjm7I1EXpMZf5m4HTlZgNLVg05e8TWWO73y/TDc2UPAl+2m10?=
 =?us-ascii?Q?v69Z2h5JcD4cH3j50WmdvUM5zcNsF2NWDU+pl4pm46bRnXIrTd4UJukj6aGD?=
 =?us-ascii?Q?5/87bgXwKWNFuJQbMPcdTyuSnfMphbOCzra8jaJtfthsUE1syh7ZSHSORraT?=
 =?us-ascii?Q?VlAWsFkaDi84f9ZPMH17MP7vaM3OWgnTeZF+P7vpieyRkYNQ2CFiG5HD/Pqp?=
 =?us-ascii?Q?iMBt6fzzQSTpw5LuJyThIQ5d9n4coXqDCHvh3V87rN8ywPJvCXJOIA3/gUPF?=
 =?us-ascii?Q?s8PaKRXka7zso+F1YaEHhsUSL9MqN86yMWJh+1PhmhHL7Aik+H8PvbwYVcwf?=
 =?us-ascii?Q?jqqXz0fpw/XQj2kV1SEf2hf5eGn2ERc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jGSr3voRoSzzklOIsK5ZAPPeee4DTyVG9i6vVOGAmPTCXcRJEGsz8vkPSOytaJNd1w58lhTCnoVKLyX4GuHzGyIsRlYfdl4giZGjkUhE1Kh87Xz6zcx7EDETRkY84xsMQFSGDTYawBT+1YBG325AqRsni8r7nIAaE12kLol8aYx/5ivfTe7GxVlaiWbkwePZM0fC0etl7tjdOfB2N26YIjevD0yWKdU89Ok3Qf9ZobQTqb0RDmS9iCYNgg5nn1y6Qg/dTEY0x0V8HlmxQzTzWtiNheZrsyLT2PYHu2QHRUkMmrm2mQMlyOm15freqUrx84pTay96Gp+mnuOul+VCMfq7420ZmHlo29h0w4AD7q9Kt9b9q5wRvSa84L26x7t1u7lkTni02+Yl7yLx8FAhMiEZC+7Ow3VYZhvSOdc4UW+JzNjFk4SPxcXBIF8xb5Px56dnF0zg7XcJOVB0Nyqxi/MGt2IdRRFSefxu9OJqKlBrt71ZyoUu1GKh8itId2NEu6vDpbcjer8GaI38QhgwAtg3j3kOsH8HBUz1y2X8J0PLJuidBJi/Cl9WRvBv0fNsAVSGIK4LPGFJpjufQyzO+WewPjgMsQu1DyTJW4oZdTw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59b8178-6b9f-4ac5-3df9-08de55148a42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:33:04.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4mdhIeSZbtGOXx6Y4KdNlZxUoWwnTnl12X0wmBjshLQr4wmtsKttpRw0jlomu3tGZ1ansnoqTF75dzuJ7Jvehr/+d984EbnYYT1GjhBEbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=873 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160111
X-Proofpoint-ORIG-GUID: 7Ffjfvb0sFBt00a7zILENwyf4vne9cxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExMSBTYWx0ZWRfXxFV8UOPMz10v
 0EuS9L/Va1DwtY8dXeTK8WKNxeHO2p6B1Go/hTVmLPeFmLwTPREzNMjhytxyXs70wCcygKb67lQ
 AlKAEg0R/nIc7Mb/qFTce805bXyG9vnuUCohKLQFAxQjnQtEs1cGZ+/OEiSPIUgWQBuR+mg7dp4
 qifdpIgA5Fpwqv2g/TRDFDn2BIt2Yp7TlY1MWB8pIs6qc+r2A3xo2SfjYLmbDXyeT2PvL6he8PY
 6X7eyGweJdSoD0WtGSLNjA3JJIwAfDvA1ivy90e+yv2At5Sghsjhi6Z3OLAe6cizHd75O0reE0P
 QEUc6lDsnGCyI8OUs5YhQWBjI6qE0aJh9ZsnPVfPHuKGU6awUdOlbMQNDRBqTvbxLoM/77Ds+jP
 il2Q6sMu5y558T0xN2jcSB88qDpc5AF+1P5MjDTLB4i9M9jq35SGtCATBJnVV5lgsVy65cXDDPs
 aqeDNTAKSeY4VpagZZA==
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696a5a35 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=G4Ho3U9JYnCE88iqfcMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 7Ffjfvb0sFBt00a7zILENwyf4vne9cxt

On Fri, Jan 16, 2026 at 03:10:52PM +0000, Alan Maguire wrote:
> On 16/01/2026 14:48, Kris Van Hees wrote:
> > I think I am missing something...  IS it your intent that this patch provides
> > for full system-wide tracing with wildcard support, i.e. where you can use a
> > probe specification with wildcards that is not satisfied yet by any probes in
> > userspace processes, and as processes are started, dtrace would attach to the
> > probes and start tracing them?
> >
> 
> Yep; this works, along with tracing of existing processes for the traced
> object. See the documentation patch for an example of doing
> this with python. The example will trace python probes in python processes
> that were started either before or after tracing has begun.
>  
> > I do not see how this patch series accomplishes that.  If anything, the tests
> > are all using direct invocation of a single program being traced, so the probes
> > are guaranteed to be available (discoverable) at the time of D script
> > compilation.  I do not see any test that ensures that a 2nd process with probes
> > that matches the probe specification would also be traced correctly.  There is
> > also no test that demonstrates that starting dtrace with -Z (allowing probe
> > specifications that cannot be satisfied yet) and then starting a process with
> > matching stap probes in it results in being able to trace those probes.
> > 
> 
> That's more an issue with the tests than the functionality itself. I can
> expand the tests to more fully demonstrate this. It's just easier in
> practice to invoke the associated command with 'dtrace -c'.

OK, but without tests that actually exercise the functionality, there is no
good way to verify that the implementation does the right thing, and that it
will keep doing that (i.e. detect any regressions).  Without tests that
exercise the functionality, we cannot review and merge the patch series.

> > So, I do think I am misunderstanding what this patch series is aiming to
> > accomplish, which is probably the reason I am having a heard time reviewing it.
> > 
> > ALl the tests in this series, as far as I can see, do not need wildcards at all
> > because you can simply write prov$target:... and it will trace the correct
> > process.
> > 
> > Can you elaborate on what this is intended to provide?  Or if it is meant to
> > provide system-wide tracing with wildcard support, can you add tests that do
> > exercise that functionality and show it works?
> >
> 
> The tests demonstrate the case where we start system-wide tracing
> before starting the program we want to trace. In that case 
> systemwide tracing adds the value that we don't need to trace
> a specific process in advance; any process that has the probes
> will trigger firing.  For example, a user wants that functionality to
> trace probes in future QEMU processes regardless of pid, so that's 
> definitely something folks want.

Actually, that is not true.  Since the tests in the series all use dtrace -c,
the process is started prior to resolving the probe specifications as part of
the D script compilation.  So, they do not exercise the case of starting
tracing prior to starting the program at all.

> The documentation patch demonstrates the case where we want to trace
> an already running program/library; in that case I started tracing
> python3 probes and captured (already running) tuned-related events.
> 
> Both are valuable I think, and the combination of both is too; i.e.
> regardless of when a process started (whether prior to starting
> tracing or afterwards) I want to see events.

Oh, I certainly agree that this is the functionality we want.  I am just saying
that the tests in the series do not in any way exercise that functionality, so
there is no testsuite verification that any of this actually works and that if
a regression were to occur, that there would be tests that show that.

So, we definitely need tests in this series that show:

1. show it works for executables and libraries with -c (you already have those)
2. show it works for executables and libraries with a program that was started
   before dtrace
3. show it works for executables and libraries with a program that was started
   before dtrace AND for a second program that was started after dtrace
4. show it works for executables and libraries with two or more programs that
   get started after dtrace

(I think those are all the cases one would expect to work)

> > On Tue, Jan 13, 2026 at 04:51:23PM +0000, Alan Maguire wrote:
> >> This series adds wildcard support to stapsdt probes to allow
> >> tracing system-wide; this has caveats due to the way the kernel
> >> implements probe addition.  In essence, probes are added on a
> >> per-inode basis (actually in the VMA associated with the inode)
> >> so it is necessary to identify the file where probes are found.
> >> Probes will fire for existing and new processes (the RFC incorrectly
> >> said they will not work for existing binaries; they in fact do).
> >>
> >> Patch 2 describes the approach; to facilitate systemwide tracing
> >> we need to tell DTrace the name of the binary/library via either
> >> using module absolute path (patch 1 updates parsing to support use
> >> of a '/' in a module descriptor to faciliate this support) or an
> >> module name; to expand this we then use [LD_LIBRARY_]PATH
> >> to resolve the full path.  ELF reading of the file and insertion
> >> of probes then proceeds in a similar manner to per-pid tracing.
> >>
> >> Patches 3-8 test various aspects of systemwide probes; basic
> >> binary support, library support, listing support and is-enabled
> >> probes support, and use of absolute paths.
> >>
> >> Patch 9 updates docs to describe stapsdt wildcard support.
> >>
> >> Changes since v2:
> >>
> >> - support absolute paths (patch 1, 2)
> >> - add tests for absolute paths (patch 4, 7)
> >> - document systemwide probe support for listing/using absolute
> >>   paths (patch 9)
> >>
> >> Changes since RFC:
> >>
> >> - update documentation/commit messages to reflect that we also
> >>   catch existing programs/libraries when probes are enabled
> >> - fixup provider name for wildcard probes to be 'provider*'
> >>   rather than using the confusing 'provider-1' since the
> >>   latter is the concatenation of probename and pid (-1 is
> >>   used to connote all pids)
> >> - add test for is-enabled systemwide probes
> >>
> >> Alan Maguire (9):
> >>   dt_lex: support '/' in probe descriptors
> >>   stapsdt provider: support systemwide probing
> >>   test: add systemwide stapsdt note test
> >>   test: add systemwide stapsdt note test using absolute path
> >>   test: add systemwide stapsdt note test for library
> >>   stapsdt: add test for listing systemwide probes in object
> >>   stapsdt: add test for listing systemwide probes in absolute path
> >>     object
> >>   stapsdt: add systemwide test for is-enabled probes
> >>   documentation: update stapsdt docs to describe wildcard support
> >>
> >>  .../reference/dtrace_providers_stapsdt.md     |  54 +++++-
> >>  libdtrace/dt_lex.l                            |   2 +-
> >>  libdtrace/dt_pid.c                            | 177 ++++++++++++++----
> >>  libdtrace/dt_prov_uprobe.c                    |  17 +-
> >>  .../tst.stapsdt-notes-systemwide-abspath.r    |   2 +
> >>  .../tst.stapsdt-notes-systemwide-abspath.sh   |  51 +++++
> >>  .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
> >>  .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
> >>  .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 +++++
> >>  .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 +++++
> >>  .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
> >>  .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++
> >>  ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 +++++
> >>  .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 +++++
> >>  .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
> >>  .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 +++++
> >>  16 files changed, 845 insertions(+), 49 deletions(-)
> >>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
> >>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
> >>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
> >>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
> >>
> >> -- 
> >> 2.43.5
> >>
> 
