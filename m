Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED0143872
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538574; cv=fail; b=Tc/fPXVlmMwPjgMkmUBDBi2bkFWwRH/d9LbmA0xfCMmjtJ6RiVuG7mn6HRq+FNaKFAXqLoESZ/n46oxXRbHoThhZ+2++PtPcLtIAZBA5JXLm7i5HVcjLRKcs50ptCZuSEmUE2zKd05hz2LTBh6rBiH9TgMyI4Gx6wE+A16GNXGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538574; c=relaxed/simple;
	bh=FPeztL0tG17x7FOQDGjD5daWlnEWSP4Y5N5KIc4WS/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J9nWcvGNUdUdCAz/mfkGfhikE9eAs8RfWWT83d6eBbQhaCMlyIFEckDE7+RW++xFzqPnCoplCsxesRvVqs/zgm4NjLLU21SxAIhZhhGxQH8bcrPHRF9QIZbyKOPhzin1KVZ6HkeeaDARwDrCf04+KAYY2gWd6fMSrzt5CQeOL5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JggIDpqy; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AuIeAKtW reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JggIDpqy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AuIeAKtW"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0mt9025924
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=rPKZWCWL2Ck8rhHbJ7tNFytWCq2bOdL9s6UhNzYTEWM=; b=
	JggIDpqytUc2E0BTdljGDbbile7isGQXmZX6Pg2l+jB8Gtko0Ycovu4RArpUrT1i
	Dkm+KRltcHsg35AOKrkCYTsDNQCl85U62471ivkjPUp8Uz6TZ4J0QHNEi6p1fLgP
	NuS65h2kHd2wqM37q8eR/TyigA1QdFg+9vU+s5kQ+oPvsQ8ZxG5QgYEYnaLpu3l2
	h6f+sFJICBwkCx/kGhaR+L+nB7qSVEVXUrdn+ER95Xu+RdcrOKC0h6YV53hue82e
	EjiNQ70WX4lNWap2jj/nUpFe4PUCJ7xMVNlcWacIIen9veHIfUC3gsIsciAbJG7K
	+DPLeaMiL2ScPE88pFMB/Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgsafed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:56:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471I983l037707
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:56:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp0mc0u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5SW0sKrWHgeKNtgAEAdGX0qEvT03iFojZ/dByQdF6OFuKE2kCgPJ2mMcuhbvR8IUf7Fw+fzsYuHLFmO7fGfwerd9ULL3wHhY6MWvQfdtPfZ6n5keYe5rNwgTnbXvSCscRRSfA2xeHrRPpmZwSdPH08T9lZcFwwlaSvAIdJCYYN5pq/QzBUdH2vScjk7uj/o4bTTrwckSzdN6vjKB/cw5NtL+sV5blgnWns1vSkf6p0UFz3HlCJCCCr+R5jnYK7IvaXuIpWnsnx9MbTCQtei7TfIAiuqlwldJAm1+bToRnQBtUhoe2VSCctu6Cj8Oz6tW2Nzjk09l9pzX1kho5mmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ3t863/eu+lUz6w+wPYVFLSUd+zrMf+glh2jYkkBNo=;
 b=Tl3f6mTsGNMwuFIl6rplTTs8iNPNufkhPDkILhTcP7ojh0co61UAYJw51Q6/PY07uryDphGCFETXRIlClr+aZQFyXD2KQj0PvkMwWiA4jLetF/QKYFdFQayCFpc74/L9e9JYyndWX+JTzpWXqjkpU8GAGgIOxw3k/XU+rvsNk6t3s24BcBvceHWJJFAGu+YGZLXIihyafudHuXNsVR43g3dy3MD4RgcPeEVLddoPvZAzQMt2GjX68jGvxFI9KJ/BgtVUpJ/NwTL7RxrCPIC7kJFbovV/oLbBJAgsWsPbPfyysx+ANs4AKGlr+u5E2/MSrcu0b5EiVUdp7xM2Slyz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ3t863/eu+lUz6w+wPYVFLSUd+zrMf+glh2jYkkBNo=;
 b=AuIeAKtWDQOgNlgjReM38/RlXJsx2POZ1vPfsp4ymx4eam6YMVYlAZhWJjQnGGSF0gW4qqH77WnK7ZgD6O1It3F2mZ980L3IFEmJOoqzzYhFh9EAM9/QPhoaHmccDlsCaVS4aUBzcBsROk4AJfYbTrHPqLXacsq8O4MuWoaPflI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 18:56:06 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 18:56:06 +0000
Date: Thu, 1 Aug 2024 14:56:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] fbt: implement return value support for fexit-based FBT
 return probes
Message-ID: <ZqvaQ6LXDoRKihfj@oracle.com>
References: <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
 <b5514f26-dd94-f055-509f-b766313287ed@oracle.com>
 <ZquajuExsHKfBC6B@oracle.com>
 <606808dc-172f-5518-7734-739dfed0a781@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <606808dc-172f-5518-7734-739dfed0a781@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 2092beee-b209-4ab0-258c-08dcb25b98fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Fq4VxMcnGxhdKngl7egAQfajMdqhcikWPVrocbrP1Mm/U/U2Uj7Iz0zJRH?=
 =?iso-8859-1?Q?Ht28yuaRelGyGxtUnPpyRQzyEUx+xEZPp2o65VuzV6QgrGjX9akO2ojO5Z?=
 =?iso-8859-1?Q?LxmnDjhW4AVMEbe/3Zn94yiugkxXG4gn9V9vpJGtamGqY3zjTdiraJ2fbL?=
 =?iso-8859-1?Q?U/YyWJszQA8IPJOtf/S62Xs0hM3NCRSCo9qC4t2YMg8Cwpt0N+MI5jKqAt?=
 =?iso-8859-1?Q?KT+ywwgj6Z1A426rKADbzuJ2TRt+TDeZzwEqEfXGWiNbLswEWv2Li4BMq5?=
 =?iso-8859-1?Q?auOTJfX0OJt9ZUC52LAqC3BH/ABdXyyXVC/w1YEVYg7zJvBXi5Wb5usSB6?=
 =?iso-8859-1?Q?exItdHYgUm8g3uwJoInxM+N2AwHjXdKUlk/Dizvd6Y9snx3ur/cex2cJ8i?=
 =?iso-8859-1?Q?jzlQ1ZnViSJD8Q6qEM5UVhwmx2u9qyGCeT8TBFLLN6bVGCux8QCzHGUZYY?=
 =?iso-8859-1?Q?zLwdXCk5KP13scwAIT5L3w0tzXteWIf0hgmJAaw3eGUvMKFnoG0wLMeasN?=
 =?iso-8859-1?Q?ek59RSH6ZFwg3dSU8Jjba9cPbI4HKEH4TmLlv2d3xg2me5CpjsIOv5iGMx?=
 =?iso-8859-1?Q?nt6oH5NH0IvO9/PtqLdYabWE5Cf/uqm+wAyOp0DFovpDWLXqwYTUiZtGGq?=
 =?iso-8859-1?Q?gGsJTC1jQpq0dp1e6J3vue9M19Xe3PEKSXFT2MzSQX6FREAXRWi9/7RFDs?=
 =?iso-8859-1?Q?gaUfd2i9KJfs5vUT41Wnfp9O/8VUzjERWfzOOsjhA9IGY4YUvM0inQKnvV?=
 =?iso-8859-1?Q?vLVjFtjpoWeOOmbWXJVlwobvf1Rw5kPKbIs+tPs37ntPlOgEV/3AN0t5K0?=
 =?iso-8859-1?Q?UNIgSwTcL2Top9HoheCB/evmc+ADECwwpl3cVVgiZrvHlhvSnVLojzOF5w?=
 =?iso-8859-1?Q?a5xMjuaOUcmc0bH3TsZVzG31ihTO3oJ1hXUYUEpD4C8B9gPwNDlrtc0NK2?=
 =?iso-8859-1?Q?Nw2OyybZBGk5Ibl+SjiuVwQGnBj4HXNytpewxgVwwE3Bie7gNmlP8TW+Xp?=
 =?iso-8859-1?Q?n/werTExhcFG+RqVPgdQlosED4sbyNrjDeySTPi8iyTnsi5HVkbsYNyRei?=
 =?iso-8859-1?Q?16ZYVFJUmnbaBocVFASLx2IA35WCjStqmOA2rjOJIhsXQB5sDBbD+/Sc79?=
 =?iso-8859-1?Q?OQJ6edq1juVDgBr1eAAE6ApJ+MCdt5sxy3G5SBxnY1DfngYOBi4WtR+p2r?=
 =?iso-8859-1?Q?zLIZRGCINYOsY+QNHEFgW/JB6ncPP73kup7FwEWZG+/k2r3j8qlxAFTN71?=
 =?iso-8859-1?Q?p6AFev/edq06k4S4d+AJQ9052nFe4AeWNhUGfyLQhUptC6o0b/WtruYW7o?=
 =?iso-8859-1?Q?CL35zY3R7at1A8CKnOOl7zcv9ObE6icuJ7cjEGk1fRtxs9F0nHkx0/fjVP?=
 =?iso-8859-1?Q?zbwY+Ixv+IqtSXf0S5aKEv/7TLl3Vf7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?y+o1EDzQS0xqX10mbX+POFdVCDTjRIJSA9CM2YW9kXQxlcWjAAexb8ZDh9?=
 =?iso-8859-1?Q?Tj8Kn5cIY9hswM1QAmkcrTUlDGmGTseUoRIwIXjuuTdhG8BsvNttobUInR?=
 =?iso-8859-1?Q?i0ecHc+hujWOFVpDGVHJL3yDXC36nfIEy4SaUJ2MewqMN1GYEig1UBmA+J?=
 =?iso-8859-1?Q?hl2SV3ObuvPASJ1runhHqnBxthFMp60sss/DYRSxyodbZR3aDDgRh29f12?=
 =?iso-8859-1?Q?399+Pz1ovOqQ15jABj304+CKrUzUAcLoBniBLXiDO1afsLPxC1ccnTfi5O?=
 =?iso-8859-1?Q?+x50l/5uRJiQ3qxZYK9RMaaiJe2HjMFy8V1wslHs/9mU8wKzTdfu8n0pHR?=
 =?iso-8859-1?Q?oSyAHXVfqa7tV9h/kg+BQ77OTIFMZ2TOvg60CFDFDvhUVsjVfd2Qv35TQW?=
 =?iso-8859-1?Q?RuVjWhQG5j8+dyPNHRrSJQkHv/U6HcKKGQ1aDCv4ocumrfsMdhjTrWbaZS?=
 =?iso-8859-1?Q?aV/33s7H9QcLEQEgjIHgyLI0e/d5jvjlk+j1ZxZeOofRkhLw4k4HJ2QcQj?=
 =?iso-8859-1?Q?wrRPjX0JlRvP3Nrf3eQyQ+7dhTPGDuXxmXioKIA1SFjb6jw1LCJ3uyESB1?=
 =?iso-8859-1?Q?wRB9zryefB3DmNzSdH4+FHbD1oNU5V2/OWMxkTB5PkpMbsOt+qTFTP67ef?=
 =?iso-8859-1?Q?mIxB9WTyBTzF9uvO3nlDl+EPpEoM37EanxhHBB4ikgIyiR3W5vbzFcokaM?=
 =?iso-8859-1?Q?I1f0wmK6INEOHtdswbUSzEqMcY69Y2BamgbBSpGhZ53iYrnZoZ1CfPOvZW?=
 =?iso-8859-1?Q?zxAjc7rdlIjVjxW4BNlEWuTLTEZ+Auy+MFr2I3YkgrzQhCO4pRlahOyzpC?=
 =?iso-8859-1?Q?qIfS+/fzc5Tpmp5BX37aihS8A5xJB2AxcrN2R0269x9GNtTw7DQ3cMMhQD?=
 =?iso-8859-1?Q?TZ5JQ7HfRmWYNrRD8Wbn+/mRqec8YYz8hwTL6Wt8sMMer4T6qHPUGOtPpO?=
 =?iso-8859-1?Q?HP06OE84i4rTdTilOi9ahkRQwWe7UqnszKMe0COolgGq48na5IVGC3KlHb?=
 =?iso-8859-1?Q?UgdqOTWQNRvGmIEPrvo8X0OIJ2MKEgG+papeGShTErcrJvY1YUzj3U2jMb?=
 =?iso-8859-1?Q?gs1zHs68P2CLQmCV33hcPK5K6jOFz85ExLFy5+d7hUiy9go+HNHn4zcxf4?=
 =?iso-8859-1?Q?vDA550AvIZJi0nX8pJ9AqKwV7LyhLLdDUchtkbZlStwWvjflBbKbY1D8ZJ?=
 =?iso-8859-1?Q?qjw2CGVxwcBnrqSYUjOmd/0irUavJIHErKoSquxhSk+imzE6zlTstbTvm4?=
 =?iso-8859-1?Q?SmrrzqIBKnx+CgI/IbrEWJdJB3aylSA6mwOzuP4qrsYZQxrw7EDs5t2yNP?=
 =?iso-8859-1?Q?M4nR7XNbhUA9hNL3pwMerMjqYsQqYyKrB8bU7Cuk8tDhvERauTnoQc8ILh?=
 =?iso-8859-1?Q?4MBXewbkBKn3chNPtClp3xuuhwnkp9M6aB/3p3PQ4tKZ0RRC9DV+sidVLW?=
 =?iso-8859-1?Q?Gq7ssIVn+dB5Sd3HFB9/RQwfK/Q7+sSyU8dNyO33rAHW+hqOARGlm/1uDJ?=
 =?iso-8859-1?Q?MGANDRIX5IixwNBJguv2DKHrVFdQ5R25e1qSGWfgFdvD+Lfsle1lgGKBS3?=
 =?iso-8859-1?Q?J0DSkyCiW6CK5Ap/MCwkRhU9nj0CEcG4goO897KAC2yUUF87rD33nEazPU?=
 =?iso-8859-1?Q?89nMEdEkD9aAh3ZJdEuSf88Xz+qDzWJmJ9PMfHH4CYMGdqp7l0rxBxHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dhXSTdZa+cwjJBGTZnjBixLFwivHCB5UTfEq4gXBU5E+t7UG0JmJ3U2siVv8FqlqfKHqXTgpYFdB+MQcfOQC+/lT9cpgVS+nWSokF1ar47C0AFLHqJdZJHlOpSL8fLiGguq/HLLiB2bzXG8Sq0oPPgQI+h6nvEGnit5y36PHmMG+mKC2UhUezRXH+NQS4axXv35eDUiWMmbLKCTn1DWOlQnCnLrsmLiulI2fHmwcHs0WuSr6VuCRV4JtLg4gQD/fHaBupDylIWUjKrwb7HozolqDXRnAILsk5ZOUgpJq41Mi33sWjcC02TVrxD8KSD0DYpJvb82QLdEC6bVWU1fUDXx0gVHfFjsJvZo0HwTypZKqjuX9uj/vku7bXAzwOPbvN4r45ZX0E31Og54rpMMZTlPIwRkiu9uC0WSDeTjsVj4HOhWeB2zQadzOAHZqMzegqzGCzQFTOzNnxvx6gwjCW8YTjxXfNWyji42ctn+4XY9AoJaMr+NuxyXrDJ/90dAqnKDeerr4Zkx1my9AV9nCbTqx/fPgX9DciUght2ECnSV5nrYf+V1b9qHWn0lgzkDdTj+b9YBfExqnD+ddRrWni42uqnonfD01Qdz9cACa2Jc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2092beee-b209-4ab0-258c-08dcb25b98fe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 18:56:05.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwUlDuaDqTFVP8fXRKXWIs2gP7PWJHnaltlt03fN8oZOuy8A1gbWVbNbGBbObs587E1YzDNTHPHx4hFacTGDX/gUmup3VBsBuyB9tIUkyO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6608
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_17,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010125
X-Proofpoint-GUID: um4629JWXm5NYGOJuzrjYB0ruOhelA2h
X-Proofpoint-ORIG-GUID: um4629JWXm5NYGOJuzrjYB0ruOhelA2h

On Thu, Aug 01, 2024 at 02:15:17PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> with a few nits...
> 
> On 8/1/24 10:24, Kris Van Hees wrote:
> > On Thu, Aug 01, 2024 at 01:49:35AM -0400, Eugene Loh wrote:
> > > Is there a test?
> > Yes, the testsuite already contains a test (tst.return1.d) whose failure
> > prompted the need for this patch.  And with the patch, it passes.
> 
> Thanks.  So the earlier culprit/insufficient patch (fe2101e5) went out in
> the last release with this test... failing?  Not tested (on fentry systems,
> where it makes a difference)?  A known failure in the last release?  (I
> forget.)

Well, against all odds it actually "works" on older kernels with the quite
insufficient patch because by total coincidence the right value happens to be
present in the correct arg slot.

> > > On 8/1/24 01:19, Kris Van Hees wrote:
> > > > Commit fe2101e5 ("fbt: implement based on fentry/fexit probes") failed
> > > > to provide a proper implementation to pass the function return value as
> > > > arg1 for FBT return probes based on fexit probes.
> > > > 
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > ---
> > > >    libdtrace/dt_prov_fbt.c | 20 +++++++++++++++++++-
> > > >    1 file changed, 19 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > > > index fa888ed8..99b42586 100644
> > > > --- a/libdtrace/dt_prov_fbt.c
> > > > +++ b/libdtrace/dt_prov_fbt.c
> > > > @@ -172,6 +172,7 @@ static int populate(dtrace_hdl_t *dtp)
> > > >     */
> > > >    static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > >    {
> > > > +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
> > > >    	dt_irlist_t	*dlp = &pcb->pcb_ir;
> > > >    	dt_probe_t	*prp = pcb->pcb_probe;
> > > > @@ -185,6 +186,8 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > >    			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> > > >    		}
> > > >    	} else {
> > > > +		dt_module_t	*dmp;
> > > > +
> > > >    		/*
> > > >    		 * fbt:::return arg0 should be the function offset for the
> > > >    		 * return instruction.  The fexit prpbe fires at a point where
> 
> Might as well s/prpbe/probe/ while we're here.

Good catch.

> > > > @@ -194,6 +197,21 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > >    		 */
> > > >    		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> > > >    		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > > > +
> > > > +		/*
> > > > +		 * The return value is provided by the fexit probe as an
> > > > +		 * argument slot past the last function argument.  We can get
> > > > +		 * the number of function arguments using the BTF id that has
> > > > +		 * been stored as the tracepoint event id.
> > > > +		 */
> > > > +		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> > > > +		if (dmp != NULL) {
> > > > +			int32_t	btf_id = dt_tp_get_event_id(prp);
> > > > +			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> > > > +
> > > > +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> > > > +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > > > +		}
> 
> I assume we don't worry about the handling of dmp==NULL because it's
> "unlikely" (already been checked) and there's nothing more sensible to do
> anyhow?  Or load arg1 with 0xdeadbeef or something?

Unpredictable result is probably the best we can do right now.  Any deliberatea
value isn't really any better.
 
We need to look into a future solution to provide proper error reporting
during the trampoline creation.

> > > >    	}
> > > >    	dt_cg_tramp_epilogue(pcb);
> > > > @@ -274,7 +292,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > > >    	dt_module_t			*dmp;
> > > >    	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
> > > > -						     : BPF_TRACE_FEXIT;
> > > > +						: BPF_TRACE_FEXIT;
> > > >    	dmp = dt_module_lookup_by_name(dtp, desc->mod);
> > > >    	if (dmp == NULL)
