Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166C1B86D6
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725048448; cv=fail; b=dnal0byP/XxRQRxb1B51ugNg5j3WUTxfqKJnOj0rB4vAcJV33mE8xVQiZaXcDbQgCcv+suRZobsI8cK+OPYtY4ICMJ47/EPXQf9Eqkc1tpo2ZqteP7PHJk1dBxMEDw86lflH3fRJvpaXSi4COdMrjAdmFxppvNPE3ip3Aq97ULY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725048448; c=relaxed/simple;
	bh=G2w6FUlPQzt4gcNcZnXHuoBhYRY7+IVeJQ18yyVYaYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l1mdz9lOP6B4s1stlHn8DMcpMT/eHuvJKpDkpW215xHHnbv5EHgLR1nEQn6TJAxWHa5Pv3xEBDMlN25DrZx9dpd188hy1WVsJF1krE7iW4L+CVd3v0Av2CycYGOY44HaBoweBILsTrJaX17FU2qok7ePMQMvcIcK8t7zIqEUu/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iuj2LCkP; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qJrElIBA reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iuj2LCkP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qJrElIBA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UK1BgA013579
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 20:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=NZ76Mu0EWLnKFSN2OYhmPranR+YSMiTd8XRNTvcCr58=; b=
	iuj2LCkPC9GubZDS51eItmVV1+5EdY20otG/mDWkcjSFYRQUFcILu9aZwli1kYuD
	GA8MdWgHfEl191pdr07GXIg51NlDnNF1CaD2H9YCWgyktcqyEgmPE+wLQq9GZJTN
	3nGzSanOqalHrAsCL2Tsbj1JiOhl8Yog7ukmEfuUxqZ+iX3sNYhBzLsn8GEFyJWw
	XLjXPyihadhzSDQx+ls638o7wda5jlnWH8jHXZlA+2x73SfTA5htaBnJ7JzzheUh
	aae7jtEn+4YlsiXPL6Lg4vkwUmAadTmnXj1OaTc+f3B0YEMJwiYLGthxooJmzff3
	kEX8U/KR2f1QgGc/sVgvRQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41bfgj0r3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 20:07:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UI1TKH036488
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 20:07:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jq0g81-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 20:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap3Jf2c6ifAWuoj7CtxO1tH+S5Mvx0AE03wfHM0fTdgtcZTkUVQF2S4ZygKItc259XMXwBlav8wYrU5OLz0fg5NNLZDocA/wZAV3KjtAB5r65klPvbAbl/hAsB7RNFo5/v6ZlJJCL5HX6UG+aV1zLyBhTh220WjW8ifdHr0FEh18VnS+MfRkOe2/e5Ey+voN1zZw5c2BSbdGagOO+pZjyjC4/s6fdlMNZ9/FFwbAvVbTrszYpgZpkIdMS64AQWJpG7UYGYhkuETpsLupMV8/alurOJx/ROXxnz/nGW1Ks736wwhQ0o+XKalcv313RybRQMA54Fmba4NooM1UQeXwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8SPbk7i5OfuoNmuajwdwQltnHTVH2ZHCmDVxF1ikiE=;
 b=iiKpbwaQGvLwLaIL6uiMK7+D7pOMOAhldBxDfYBVa+OnCuNMu1HsKG2TnYH7UkCyDrMA1faOcxiikif5YKtkE4j5o0NAqYLi2inVQgtNyllgLz3pdvSy7HdgeNq8rWQZxF6GS3AYAVINymXQcq7gTUMP9iIETDjX9oZuwpGy7xrDis5FevqEz1/JNdeTEX07yIYo9uGAvU/DOCR7tMX14AIKqsoi0Mfls3BRRwseP9N912iWyIVIZ3ITscvyV8V3exCDnoMTkFl9hNyx7QXgAkViPG7hLw/nhN2PqG66YgcDwDOdPJ8BwbnSp23ah8svN+I37Nj+yognqYbQl7hRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8SPbk7i5OfuoNmuajwdwQltnHTVH2ZHCmDVxF1ikiE=;
 b=qJrElIBA7AnjP9m8Va6mRXroGJ4zgd5W7kcqc7BOuByJAYgDn0ygn3RNEQsyBFdk5nDZ568UuVQF6PWr6NLe4/LoS9XFMt2uIqau/NsoODeGvIogHljNZ6BxgcBKdDykEAG3vg+nECmxmbPEG7p+UNIZgK7PvXsKIAEQnmouoHQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CO1PR10MB4707.namprd10.prod.outlook.com (2603:10b6:303:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 20:07:21 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 20:07:21 +0000
Date: Fri, 30 Aug 2024 16:07:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <ZtImd7svpHKXgECs@oracle.com>
References: <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
 <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
 <ZtEtwnkc2gWT3zwD@oracle.com>
 <10a8f685-b3e6-bf99-0579-c47408dd39ec@oracle.com>
 <ZtH5F7Y9xZ8yykFM@oracle.com>
 <4e45d037-d902-826e-e43f-71772f04941c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e45d037-d902-826e-e43f-71772f04941c@oracle.com>
X-ClientProxiedBy: MN0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:52f::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CO1PR10MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8f571a-6223-4414-c1fe-08dcc92f5b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?yGYAdgr54zYy+iLWr3dABsXwlmqr7F6uk5XvBxs31n+7jB/EtZMf2DyZBs?=
 =?iso-8859-1?Q?Q7Sk/5JAqQGnTuC5t8kP+hpDDDHWFbj2cOjMA1pAgs66jPxYxPf+pDmj9g?=
 =?iso-8859-1?Q?JW/2aAQqrsEjY2h5ekJ4xxpTBtjup+hmire1nYpNaFykCzJdIEK/m0S4Lx?=
 =?iso-8859-1?Q?/pcX90Arh5OheN9txluyv7jFmbsAYgJtgSB4W3DPPU3dLRhJA8QuTFdO7Y?=
 =?iso-8859-1?Q?qZr64UpmL4oI/40ujwYiGPH1fmCS3he5JWKmQerOGUinKA3b1bej9geSBN?=
 =?iso-8859-1?Q?VLZrbSqg7Tr0BdFsjOBkamBD/WGUBeTTwQPeYGiT0aP1aCwH1UYRmLIgXm?=
 =?iso-8859-1?Q?c6L7LpXSgrORZVwMJs7Cc9136blJurItruJ0hNNSI9ytiUC0aEEbUkEaoE?=
 =?iso-8859-1?Q?qy90pvIaHTr6gEuFH4VkE/jFMkdpU//IszvYzu3kt/SefeJVHzuI6BtuAX?=
 =?iso-8859-1?Q?c+JNI9DYT5HhCSn6lmy1VZbsIH7vIt6TthSoM7y85Pr9wRaGiKwWJs8ZqF?=
 =?iso-8859-1?Q?uhJwTqSiMBFZWh5qrm5PoLOZ3qKBVBszllebrZ5+ujvwKiFbs0IKdooMEY?=
 =?iso-8859-1?Q?jBng/tZplwBwL6+1ovM9NxMGNUnQOAeEAqAmeZELUNd80N48fOU7Nhmxjn?=
 =?iso-8859-1?Q?oYSNCZX28YOHgvywlxhXrUXI/GX1XIsEqdKTl+KaL+PcZcvEFn4Ck53uL5?=
 =?iso-8859-1?Q?UozuNK1ePHgpOGEgFpySqOlAO2vW/OCCrPFqoZfJsBtxe2XlFSSMyJdDU+?=
 =?iso-8859-1?Q?WbotATLpK2bdrrjNF9liXyYug8qCaJzARFB44BxY6/4f6b29SkK1UuuDcr?=
 =?iso-8859-1?Q?qRVglHqWDB0AHRAQeCgT/11c9lNh/A7fuKRaOIP29SMS/punu3aOQioUSL?=
 =?iso-8859-1?Q?U7/A/tSVrYEdA7uP4JrW8hplrP/GXzJXOcGSpYeoLxhxOp6FMLlv/e4zew?=
 =?iso-8859-1?Q?JzjkviawgB2oNuADaFm1qofqe5mdRU6LRlpKjayxFry+ayFp7IKL9TlgjE?=
 =?iso-8859-1?Q?VaR5YPz0Co7z7rRc9pY/rJZdUoxHCKn+ucm5mjzI6acLUe/8U3mNVp95Ho?=
 =?iso-8859-1?Q?5+pUh3mzC6woUXNZOSBZdODnfnQEbMggkyO6/SGXRYJxwtcA5T2vDjBpAk?=
 =?iso-8859-1?Q?NCCe2WJ67NOhEMsi7j5ObFCSE/WaY7uD9Ske8s5HgiLUViwAe1ep8dOVRF?=
 =?iso-8859-1?Q?mAiUkh81RbqE+9uB1DOIW8LPvH3axVgkjdeDNqaj0mEoClzrcqqKbJvpGk?=
 =?iso-8859-1?Q?56ETV36J2QkUTa2m5G8WBkQxlohSSwecfHpxP9sTe8eeKwVf3QIc7cPb8L?=
 =?iso-8859-1?Q?Lf8+rAgE6T0nG8P5GoUsjKnbwOOSNRZVj1obVs7i9bUfgqdMJJJNxE52TX?=
 =?iso-8859-1?Q?LEdzQAJ6ygOVkHGiXsR4bpD9rt4hmir2T4CH6/QzcJ95u+AoSFDWo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Mds6MvgbqVBwVvOERnKlxAmAAVxGGIdeS4VDzPuexKBFottOmb6C+eeggw?=
 =?iso-8859-1?Q?6nwrycI5jaKyEoMFsRcWJjjSF4SITe0x6w9Yx0QwAJn5ga+epDogSBTbu7?=
 =?iso-8859-1?Q?WaJAEy5mG5NL9ImW3xRsUPsRVWgPJkcLAAxEMjNu587a1LB52dPCE3n31J?=
 =?iso-8859-1?Q?f8NIJsp5/wZhWrv4Fxt41SyxPxjHpPKgIQNtRMntP74HfjoY5JrChHhGiD?=
 =?iso-8859-1?Q?XwfwW3rNGnbtYHlG08lId40H7YSAAqVDfyEMy6560ksxmoCJ+yIlcBQMpi?=
 =?iso-8859-1?Q?24Q8vXldrsmfW6dMEHY+I4Jr9DeDNsZSE0RBrn4e4mitZt+S0DlYunqcie?=
 =?iso-8859-1?Q?qcrMqIvDNnDrqUJn/g3xgUCCCjOjQCIVW55qkR/PUuH11EFcFwwQJIIfez?=
 =?iso-8859-1?Q?vFNx4nzcZOjqkDb7dzcsqEeyrT5OyYMiTPI2F2kBjX5xMfNAS0ETVjL4AN?=
 =?iso-8859-1?Q?8Drn8oMYmfLq6pd44Ajucu+Z2EJtbgupRLxAwmk9dFn9lbJGg7eyXKSZcL?=
 =?iso-8859-1?Q?Syo9LxsqC/yFRXerSThmh7cQGl8gJV2snSGcm+PNFIFqo93y9xO40izhXE?=
 =?iso-8859-1?Q?UVDaUT7EBX0vc0/zDu+a6CB9wRJqpE08XV9eHwhSo61/i2DbeDuQRLT06s?=
 =?iso-8859-1?Q?lBZ2PZcZQCAaTcHm8MH5PNzZ5JxHc0lWIpeOaETGSd2y+WcxnUg2g1ZOoT?=
 =?iso-8859-1?Q?fOZieCFaXTwNfUw79IxQQjdzfwMxUTmfH2dmF+eUPoEnBcI195xhOCnawb?=
 =?iso-8859-1?Q?1WkxZkf2UBoHl3DLNnWdvYXmPsbyALFQi+i1RqBTGSKPsSVAqaNRZc538O?=
 =?iso-8859-1?Q?Q/xkdfN8ggcLDN9y3dHev8YGwq39x17Ej4xMsbxrmHub/j4/5nJczYykl0?=
 =?iso-8859-1?Q?bmQTDv9tnPGEKcddJbkxJFaWrzhXxailPT3zkG4a4+gYHkZ/xHI/I+FDBq?=
 =?iso-8859-1?Q?fkNJ2yEnOTjWMVs++Q0lk9jZfl9VqSrjkHIGDJbApBLuniWC6sYWFc5ksV?=
 =?iso-8859-1?Q?m/8RFPp/yMdeWtSOrPI3QYCw9eLDwrjDJRJCFX4Xhfw1+5A0SQKmgNbw8S?=
 =?iso-8859-1?Q?ZhAdf5P6/Da2iJTor6J7JicIOu2UyeqLgn8vBORWKmOOQEz82YYjP/XNzZ?=
 =?iso-8859-1?Q?wInz7cdHaiOsiFoPFIGCqxZZQfIA61ok6nKuiSFcUaeU6aLfPmbjvYtoxP?=
 =?iso-8859-1?Q?x2h7auMhu4YKzbn9pGYyTt+NRkPLtYXrPgi3wb3fgdfmjzhNQY8z8dqmUo?=
 =?iso-8859-1?Q?pOHR4JiyEmviYJ2DmcQAE5R5KGn9903xRFSuZJQEV7TV58KgF68qol2zSM?=
 =?iso-8859-1?Q?TOEHYMwRif+2ewqX5K6Bgu6UrNfaU5wI2XvRCws3Uihe7URhPE+5krjppx?=
 =?iso-8859-1?Q?5xrEHqZcpLegTl+lEzZ4kwk94YaQ+nek8MQLvJmqFr3qMD/7brmw8GUhP5?=
 =?iso-8859-1?Q?j7/2F483xsc2FtZdBctuqekWPqviSNFDhaZY/cf8pnZmhvN2eNL4MZEgC5?=
 =?iso-8859-1?Q?4EdFYRW4WqWQkybW77jNHh16JBQxxCSUqQPY4cRvhScVbteo/SdMIr3rJJ?=
 =?iso-8859-1?Q?66iAi1zGTRy8AIYKOGC0ZULjk7Ew8GeZVcmCx3HqGhbTFDAM8ep7/gAsv+?=
 =?iso-8859-1?Q?SQvTQDZpnPp0J66DOKGwHvznhJ4fQmhgW1+rCHP31TfCDC8/PvkD8Bvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UB9nu9M1MVcU8WfjRYwbq4nReF11U9jRs8i0scXA6836t9HqofcG2PkI9IHlwcHOkaTuCkdPBE2I9KnZoZRivpPospSmloOkgYsjhCo/eb6MF0SOXorR8MBarnDPHfhjueP5Rr5Z2ZCaSsDc1G0mUotJZl3rGdix3QaBvZZqeYJBGGWJhMFrzASJlwH/AhojBj1HXHKp8A2KydLAOnF3MOFGJMSHGYbWgdU/rOpaf12WCyke24Vkk7XPdBu9vTvHy7w/CathjEcqGIqLDoheyeSdpEAwS2o+h1bPZ7fs/9hhWk2dxQOxd07F/EAI3AjSDlGdRFds+XlI/P3JpYNjvCtlkjGom9Ha9nvuB/e9aWw6c8zKUJIzRA2UGGUZIuEz2qbcx22AvZtPwDyciEbKL4cnHok/8RBl0oA0a49MrGsmTp5S7ydO9/z+iUEiVVcvOJUeztkh5L1dUAk/YattdPjLg6mSxdd8rxTQPIMV2zXHEZlc0YmPNl966nG1VZee9jXRamvYqyBmL9X5IzZrJ6eK7jOBQG4PdFqvh9mU6UzwzZxF2aEOK4jSy6fyD9O+7DtSx83+wbP0bZWe28M/eFAH0zucEb7nSbNTkG0BifM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8f571a-6223-4414-c1fe-08dcc92f5b7d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 20:07:21.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM/WLJx3rIko8/TpXyy6MD9NWAIH9A8ekra7w450SeCN9YIfOmwnU0BUHh2VXQLo+JOIuUnebabzy/SCjU8b2aqOhSua2PgigQcb6HF9/j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300154
X-Proofpoint-GUID: RkdICriOXKipQe-I3YJN6r04D9VU0MQ2
X-Proofpoint-ORIG-GUID: RkdICriOXKipQe-I3YJN6r04D9VU0MQ2

On Fri, Aug 30, 2024 at 03:06:02PM -0400, Eugene Loh wrote:
> On 8/30/24 12:53, Kris Van Hees wrote:
> 
> > On Fri, Aug 30, 2024 at 01:42:38AM -0400, Eugene Loh wrote:
> > > So do you have a proposal for what the new semantics for bufsize should be?
> > I believe the semantics of a user-specified bufsize should be as follows:
> > 
> >   - If the bufsize specified by the user is less than the minimum buffer size
> >     required to store the largest trace record, an error should be reported.
> >   - If the bufsize satisfies the minimum requirement, the implementation must
> >     ensure that it is round up (if needed) to satisfy the perf ring buffer
> >     size requirement (size needs to be 2^n * pagesize, for n = 0, 1, 2, ...)
> > 
> > Point 1 is clearly debatable but follows the principle that you cannot put
> > something bigger into something that is too small to hold it.
> 
> Thanks.  It helps to see a specific proposal.  It just strikes me as odd
> that we would say a user specified too low when we're not going to use that
> size anyhow -- we're going to increase it.  Why should we complain about a
> request we're going to ignore?

We do not ignore it.  If it is not big enough, we report and error and exit.
> 
> What do you think about not automatically resizing?  Resizing in legacy I
> think was by default and rounded down.  You autosize up. How about we don't
> resize?  If they ask for less than min, we complain and tell them what the
> min size.  If they're not 2^n pages, we tell them so.  The default right now
> is 4m.  So if someone is playing with bufsize we might as well honor their
> request (and give them guidance if what they're trying to do doesn't work).

Resizing in the original code was done if the allocation request could not be
satisfied by the kernel code.  The kernel code would then try a series of
smaller sizes until it found one that resulted in successful allocation.  We
currently do not do that and instead simply fail if allocations fail, because
we can - it is all done in userspace.  We could do auto-reduction to try a size
that works, but the user can do that themselves as easily.

The increasing of the size is done automatically because we do not want to bog
down the user with needing to know what select sizes are acceptable.  If they
provide a size and we can satisfy it with that size or the nearest acceptable
size, we can just do that.

Look at it in similarity to malloc()...  we don't know whether our malloc
request is satisfied by the exact size we supplied or by a larger block.  And
as a user, we do not really care.

> > > (And, why not simply ignore bufsize?)
> > Because we want users to be able to tune the size of the tracing buffer, which
> > can affect performance in terms of how quickly trace data is generated versus
> > how quiickly it is consumed.  It interacts with things like switchrate.
> > 
> > > On 8/29/24 22:26, Kris Van Hees wrote:
> > > > On Thu, Aug 29, 2024 at 08:54:46PM -0400, Eugene Loh via DTrace-devel wrote:
> > > > > On 8/28/24 17:16, Kris Van Hees wrote:
> > > > > > On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
> > > > > > > On 8/26/24 12:20, Kris Van Hees wrote:
> > > > > > > > On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
> > > > > > > > > On 8/26/24 10:30, Kris Van Hees wrote:
> > > > > > > > > > This patch goes against the intent of the code, as far as I can see.  The
> > > > > > > > > > point of performing the size check prior to increasing the buffer size was
> > > > > > > > > > to enforce the limit on the size that was explicit set by the user.  Then,
> > > > > > > > > > if that size was sufficient, then DTrace is at liberty to increase that
> > > > > > > > > > size to a whole multiple of the page size.
> > > > > > > > > > 
> > > > > > > > > > But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> > > > > > > > > > not enough to store a single trace record, DTrace should report an error
> > > > > > > > > > rather than increasing my bufsize setting on its own.
> > > > > > > > > The point is that DTrace *does* increase my bufsize setting on its own.  Why
> > > > > > > > > should DTrace complain about my setting when it's going to ignore my setting
> > > > > > > > > anyhow?  What value does the pre-existing behavior offer to DTrace users?
> > > > > > > > > Are you saying that DTrace should not resize?  That it should honor the
> > > > > > > > > user's bufsize?  No more resizing (to page size or whatever it wants)?
> > > > > > > > The main point of this code was to retain the bevhaviour that DTrace provided,
> > > > > > > As far as adhering to legacy behavior... quite simply, we do not. We do not
> > > > > > > set the "principal buffer size" to bufsize.  Further, any legacy resizing
> > > > > > > behavior is, if I understand correctly, to go smaller than the user
> > > > > > > requested;  we do the opposite.  Looking to the legacy behavior for
> > > > > > > precedent is pointless.  The situation is that we are unlike legacy behavior
> > > > > > > in fundamental respects, opposite in another respect (automatic resizing),
> > > > > > > but consistent in some impractical and useless respect.  That consistency
> > > > > > > strikes me as small consolation.
> > > > > > You can look at this from different angles, yes.
> > > > > > 
> > > > > > > There is no documentation to change;  the documentation is already wrong.
> > > > > > > This patch was intended as a step to making the behavior something that was
> > > > > > > describable.  Clearly, trying to hold on to a legacy buffering model has
> > > > > > > produced a byzantine situation in the current port, which treats buffering
> > > > > > > very differently.
> > > > > > Yes, but if you want to go that route we ought to go all the way, and not some
> > > > > > interim solution (see below).
> > > > > > 
> > > > > > > Perhaps we simply disagree on those points, and this patch is DOA. But the
> > > > > > > patch points out other problems as well.  E.g., the min computation wasn't
> > > > > > > even right and error checking was wrong.
> > > > > > Let's do this as two patches:
> > > > > >     - one that ensures that the computation is updated to the current
> > > > > >       implementation changes and is correct
> > > > > >     - one that provides for increasing the bufsize to be the smallest multiple of
> > > > > >       pagesize to fit the largest trace record needed for the tracing session
> > > > > > 
> > > > > > I don't think that checking the rounded up bufsize against the minimum size
> > > > > > makes any sense if you are going to increase the specified bufsize anyway.
> > > > > > Might as well increase it to fit the minimum size altogether.
> > > > > I'd like to understand this proposal.  Are you saying:
> > > > > 
> > > > > *)  Determine the min size (correctly).
> > > > Correct.
> > > > 
> > > > > *)  Round that up per perf_event requirements (2^n + 1 pages).
> > > > No, round up to nearest 2^n.  The extra page is allocated automatically by
> > > > dt_peb_open().
> > > > 
> > > > > *)  Ignore the user's bufsize setting.
> > > > Well, no.  The bufsize setting is not ignored.  We just change the semantics
> > > > a little (in view of the new implementation) to be a mechanism to allow the
> > > > user to tune the buffer size, but within certain limitations.
> > > > 
> > > > > I'm fine with that (given that we do buffering so unlike the legacy
> > > > > implementation and will not be honoring the user's bufsize value anyhow),
> > > > > but I just wanted to be explicit about ignoring the user's bufsize.
> > > > We do not ignore the bufsize as such.  But the extent to which the bugsize
> > > > can be tuned is limited by the implementation.  The bufsizw setting cannot be
> > > > less than the minimum requirement (and you prefer to not complain about that
> > > > and instead just increase the buffer size).  And its value must be a 2^n
> > > > multiple of the page size, so it will be rounded up to the nearest acceptable
> > > > value.  But that is therefore still controlled by the user's bufsize setting.
> > > > 
> > > > > > > > which is that if a user explicitly requests a bufsize that is less than the
> > > > > > > > minimum required for the given trace programs, an error is reported.  That is
> > > > > > > > a mater of being consistent (even if it has no practical application that I
> > > > > > > > can see).  Tests from the existing version failed because this was not being
> > > > > > > > done right.
> > > > > > > > 
> > > > > > > > As far as functionality, as long as the bufsize is large enough to hold the
> > > > > > > > largest trace record, DTrace can (and needs to) ensure that the buffer size
> > > > > > > > is a whole multiple of the page size because that is required by the perf
> > > > > > > > ring buffer imlementation.
> > > > > > > > 
> > > > > > > > So, DTrace only increases the buffer size to the required multiple of page size
> > > > > > > > if the user supplied bufsize is at least large enough to hold the largest trace
> > > > > > > > record (or if no bufsize was explicitly specified).
> > > > > > > > 
> > > > > > > > We could opt to change the behaviour of the bufsize opton to always round up to
> > > > > > > > a whole multiple of page size, but that is a deviation from the original
> > > > > > > > implementation and thus is something that would need to be documented, etc...
> > > > > > > > 
> > > > > > > > Aside from the computation of the minimum required size needing updating when
> > > > > > > > patches (e.g. the USDT changes) modify the layout and size of the trace records,
> > > > > > > > I do not think that the existing code is wrong.
> > > > > > > > 
> > > > > > > > I am certainly open to a feature change to make bufsize always be rounded up as
> > > > > > > > needed, but that is not a bug fix and I think that ought to be its own patch
> > > > > > > > (along with documentation changes etc).  And it might need some more discussion
> > > > > > > > because it brings up the question why we wouldn't just simply always increase
> > > > > > > > bufsize to be the smallest multiple of the page size to accomodate the largest
> > > > > > > > trace record.
> > > > > > > > 
> > > > > > > > > > On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> > > > > > > > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > > > > > > > 
> > > > > > > > > > > The function had a few issues, mainly with its comments,
> > > > > > > > > > > ranging from typos to incorrect descriptions of behavior.
> > > > > > > > > > > 
> > > > > > > > > > > The function has only one caller.  The enforcement of a
> > > > > > > > > > > size minimum was problematic in a number of respects:
> > > > > > > > > > > - it was missing 4 bytes
> > > > > > > > > > > - it was enforcing the minimum before the size was
> > > > > > > > > > >          increased by the caller
> > > > > > > > > > > - it was checking dt_pebs_init()==-1,
> > > > > > > > > > >          missing errors with other negative return values
> > > > > > > > > > > 
> > > > > > > > > > > So change the function to accept a minimum and change its
> > > > > > > > > > > return values.
> > > > > _______________________________________________
> > > > > DTrace-devel mailing list
> > > > > DTrace-devel@oss.oracle.com
> > > > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
