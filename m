Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889928F921
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403854; cv=fail; b=XmKsB5a4b1Y9GpEdQ+Oa9yAnIB9oOR6qzHxZfuTdjYetQFXhcsR7gZOp69VsK6jucOIXR1tL1XzrRjYf2My6/cQzosEYaviC00/D2EoFKarFvpLBd/oJVPGJV47BVvdEbBMw/7LjEW+8HBlJJwzcMLRWgz2jW9wNSOXNAGtlkmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403854; c=relaxed/simple;
	bh=2vkNJ7whjgDlHU8pXUF/s8MLTNwPgtw0dNzKzUuHi7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fd9BB+2knvE4BktUp8mqJNVLfY9b/J8yEa34giZ4ItJRE8o7TJa6EEh17w+vAtTYDISw4nwgbGzymjNb07n6eRSMvl2taNwB6TY7RPAe9g7TnOB5jWKDgD+AXLj4266CBfZ8kguZmM2QoctvZzk4t9D//DFvDg7q5vCm0adQHrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YMRhfV8n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HhgfDEJ7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YMRhfV8n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HhgfDEJ7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BJgC95013579
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wZsr+7SuFkdNkM+CsO
	iyelr84gifRTZxsv2+4c3NT7Y=; b=YMRhfV8nty2SmFllplD6i06w7Lmre6etWl
	CrG4i/h218LLmlB3A3HXb21wE8KyRFXm4t9LqJnF6pY1Mf1GGJFbEzyNuIGf7kJH
	NUHTZx4aFees0Kjm6AKu0ICOJ9fLzXw461i1f+cG2FK4+gTRMOYnHA+bvHJ2/6ZC
	Mmz4S+DzaLANpJSqvmxSUpVI/zWlZFUu/YVTFdYHWD+aeSyX22rc/m0NZ325jG/D
	exgT6DCxJpChRLmi+FtvzpziRMqcwBhBbVjqfU2fsvPdh548N0yFE2AXZahYaRhw
	PRcgGIoxzf49fbdAbbb42EGHEYeSUmILMHORduUh9bQ3jX86/6bg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45y9fe03he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:37:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BKUx9D020984
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:37:30 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010006.outbound.protection.outlook.com [40.93.1.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttymj5q8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t01LlRGHfK5TFumK0PRu/LS6qOnjxnlCxKlwNW+kEOmTleMWELVqSKfbacAUP9dL5e5o4Tc52wFLmvklZfx8M+w/IS92ECXN9soRSnTi4M3PcqlZS63C4NylWSLUjuUdcaRAZrib148sx67ZP87b65IhWYYqPTL3ZI0z3FC0tNB8gr7DddDSDy1TCOy3q+CZoo1CEXzlSySTXh1zCETkNYO/1gUD+s8rQKw0dT4xUjXfjDdOCW3o5yQ25BZEivm+YQIeyatJhysYm5IIu4ARQaSNmp5lYtcD+LZKfmn8SYRGnxYXjeIERcVBXUDbIBXoeyIMBU2AtcTdETH+MJ2MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZsr+7SuFkdNkM+CsOiyelr84gifRTZxsv2+4c3NT7Y=;
 b=b8++HDkb21XFgJ5u8gmdbBex9se1CLtEoT0dwKRUlnp0AZy8ifrxBUtvWyNRs2ry9vDFE3KuSkItP6tzmpWTspNp2LwoQFYeoTMu8QXd6iOUds0UFhdFMorQ6IdtlGwvWgred8FexkKSI1tiHUxoVA+n9Zr7WwQKvyzvtmEmmAVXdqv7+Lsmm4HAt5VhckSgniC8J7hXc0aCwgR8o+Ww9E85+PFwnE78JdzAA25cbI3no5OvHxmknZatokxFRi6oIZdAZkoy16oBtrILJ74Gnx+y/61lTfx8W8q9LB1EkiLRZ/mOTe9pMMdSnOR3M+bsjFTK5rqluWjiFInDHhRSMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZsr+7SuFkdNkM+CsOiyelr84gifRTZxsv2+4c3NT7Y=;
 b=HhgfDEJ7Xcyxz1T13zd5vL6l2ypY+ZWWQmV9WwZ+88MkZN1bsXyh3K/vugPphIsLlNqZhwK6XgRF1uCJDedz8Hpj7sBuO/8+XB4/Fv+mYlWPxC3V7OHYDvVb2csrSwRKaQ6Y3nlx/jIpfT/HunCZdew91UAMteuNYKrfTVfZO38=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by IA0PR10MB7667.namprd10.prod.outlook.com (2603:10b6:208:48a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 20:37:25 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 20:37:24 +0000
Date: Fri, 11 Apr 2025 16:37:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Expect USDT argmap to fail on ARM
 on older kernels
Message-ID: <Z/l9gfaynxlx7lm9@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-4-eugene.loh@oracle.com>
 <Z9sVV5boKDQLyALm@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9sVV5boKDQLyALm@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|IA0PR10MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f5ed64-920d-4460-2ae9-08dd7938aac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMMSGn+m7WX6nCQ5+/m6btOinNQRHo6YB3wQCW2yM/RzLxqurUq+6362KwMR?=
 =?us-ascii?Q?63hKHKrHiAU6B5D9oK9B/0SHXjmHCHdrsJflzOT/JNBEaKpJhEo0HOeotLs1?=
 =?us-ascii?Q?aQSqEmU0ltCCgp153l8MFoh61/spCrfsppC2u0GRa6ek56/lt1I6kvI6ncX3?=
 =?us-ascii?Q?jof08m+iVkfhCbaCSrKwU9IwlUjENMi+fWiU9KE6mKv/Aic3810AAcN9+UKS?=
 =?us-ascii?Q?etnZcK2f4AGxLa54p9k3PzAJj9hB1NH4QL7acMbljijoLrXy0FQpbUlIdOXo?=
 =?us-ascii?Q?pBMmkcV7hF6rHdlcEcrKNTEwGQqJ3EJT2vNgrhQtNpMic2Or8RmK0fDgS/Z3?=
 =?us-ascii?Q?jT5DSDWuz4KUI5Dl2jGHqH85daKvRsNLO9KrgPxH1hnK5fvWTN48FzS4mD+N?=
 =?us-ascii?Q?AF/Ywiwz0SloV6NKqkaHzVu7C3ScE/IH1asYhoQkFo5rErwraHlZqFgg4D3t?=
 =?us-ascii?Q?nKTExG8DKJkvd/v/h0e55YCdts9VHyb95J8BAKGqFISs7fdKyfKHCG4biMOl?=
 =?us-ascii?Q?WCWQrwx8eCOc5vTY7/Yx087PlzBz1g4V9e/cB6smK771i/rLszjuAKOQkVkH?=
 =?us-ascii?Q?PGdjHUApLhLaXf33t3uJuWQOUffV8zv41/Ct4I9r/ay1co4fjP8ycb/2/mlO?=
 =?us-ascii?Q?YL9PwjF0Z4mHzi8cgdo+sH4eZZhe4cXAG1T8U+SioU/EPWwerviqrTOGoqx8?=
 =?us-ascii?Q?IwpXDCovf50ssFfY+2RMw6oZQv8MYo5Hxk3DzfOjtHyS48GbLiUoah5c2BjF?=
 =?us-ascii?Q?2F5/iGo2CUKTCFEonWVa7PELNSfYgSUe2VZZdrOuAUQEBi9MUrJlTUzY0ZdR?=
 =?us-ascii?Q?digx/Wnf37Rq7dw1ILapVWwFRv3ud4bX0NmG0WeW1yknPUTsHRM2p5lLhRip?=
 =?us-ascii?Q?GcDAVQJno8lXppItOb29NKPOEMxiU1pLxDKi9C4qRZZXY4kkTNzgNNR/HbqI?=
 =?us-ascii?Q?cPhUvbwPpDeGJ4RJqegRuLsfoao9WjcWAJGThRJ2UPeadt9jHDBhzfzOWfP6?=
 =?us-ascii?Q?j/g+UAoPs4+h9EaCjf+A3u/+pQQB968RO2zO6HobuMi76j2/NHennhZmWNkQ?=
 =?us-ascii?Q?nfKJbWKiCGVcoR47Dgc4q1NkHRQXJ4E8LtQInCEjlTiXxm1v4ESL01zJ25Q6?=
 =?us-ascii?Q?AiKYR+3MZr5jWi6ZDlZNEbhJS6htgR1KdR9nAsV8ZlIHaI0E7c792BjhFAKQ?=
 =?us-ascii?Q?ac0u6j5MIhF74Ku9mbfK8x2IUbVI2wVyomaliHfSdAaTjO0tKIhMFDYXxs4M?=
 =?us-ascii?Q?LwpFvHkcaJTFCazvXaqp28YIDlTVXDxwM0sF9SSVTO0B3a3S/4RdoGGiUkxK?=
 =?us-ascii?Q?aylu/t36LajGIFnMJ9KmJMphmUNAvqh4fErOWQpSbLNasQucWNRFe/3/SB23?=
 =?us-ascii?Q?OVpkVrM1wJZscy1F/PIJE75v8imQcf+Onpx8DpvmZJct7UACWJtXspOehhYE?=
 =?us-ascii?Q?HMUetNQVqrie/KAOuOEaW5HKxg4+Wto9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FfCnclna7OdCLNQ5kKBg/k6Z651MWlkdTMVQh+JlNiQx+xbXPVPMllz7aM31?=
 =?us-ascii?Q?dYh+x/qfTg0YopQHPhmQS+9DCvG59KyYV+WLuQZsI7UhYc9Kgd2VjnweEkI9?=
 =?us-ascii?Q?/Jyd8OA+rOQZngkgaGTLkoxOnAEiqqqnJmumAOYQi5WSB6NHSeTm7kU9cIse?=
 =?us-ascii?Q?p72n1ZWajFBpvcPNQrzSBTJhipIce1xC9bt3y40BmdB1JrWqFIJkeCVCZ/Ca?=
 =?us-ascii?Q?mY6cqiDSTd5Wl4wlUr+bXE1t07zCqTq/km7eZL6otH/xEN21FPsXW12zqxTs?=
 =?us-ascii?Q?w/+Mqp5iQxX3IIcP8jPn97f5i2rFTYGl94cP7htJSturAHhDGYwh8ns+Mm7U?=
 =?us-ascii?Q?XFckf71ka/fYZvNB+NCtgFVEcARjGd/L2UjyysPBP/mK39/DyPfcZXCa8Pfm?=
 =?us-ascii?Q?XgRNetaBE+5zip18fpekD8Ftrw9AxW7sfMmoRYfBazsuiXydgCNjS4e492r9?=
 =?us-ascii?Q?ngxb/K37EwUPEKrS+wa2JNMQx10n47FA342PSGxD5q0Jyn6KfB4QG6zTU8aY?=
 =?us-ascii?Q?+ZI+XXFL2MytTzYh/6itVHWrPWEbjKRENdPibU+hpWTeYWFGGJVjffEE15Om?=
 =?us-ascii?Q?m7pl8yOp8Rn+/q/CK5XpyoeAho15pIa1BZxj3+lPpEvEmYV83e+SH69N3h2F?=
 =?us-ascii?Q?GrKOQQdLXDYWcwAGO3C5j1fjrSdEI8su+IF76OuxLqWBrt+lN73P50IsqBaK?=
 =?us-ascii?Q?LqnI0ShEfaW9Qm3/qHTNJRao1KdOumNT0fswm+yMRt4equoIoY9pGzoQnsuH?=
 =?us-ascii?Q?VocICz5rzU4KR4/HUhQFXzOPdQ4h6nBbR+fHNmFtJe2GRIfu6X2dAP8U/tbf?=
 =?us-ascii?Q?xv7JJdI9WyQ2q+hCaxwRBzKFAqadT64rXNzySoB3qmxYhQsY84IWAuqdx3jQ?=
 =?us-ascii?Q?4h0YnpjRAmF9GXGMW6TF+chslY+O8rNiJqSfIHP/m9wVEp7kmDzyJ1jeGvhZ?=
 =?us-ascii?Q?WIae7kFUseJMfojFmFzpFVaTJ6iOYWWIPfp+iDW1J9rLbolZxmU+wGgHTFez?=
 =?us-ascii?Q?02FOXmNFEWtqvqHMQGoaArhFs6JBLv1FaYotwqzQrV/YnWlwZPf6w6OmqPEi?=
 =?us-ascii?Q?wECJ+3FYTQ2COgrLRcClzT0DMsLikIIgMnIHBioF6TDjb3/jJtPg6Q8J+K5t?=
 =?us-ascii?Q?F8ACYn4gcb9Eu9wwxRZ/mV0XpMMB8unkiv/tM66G0pBv8Nk53H0Db0Me6yjc?=
 =?us-ascii?Q?Xe32MIz/uQJOsxnXX9rokkCkRvhNVEtI4ONIWkFKBZHkLTDk1GhZCDu9/K0O?=
 =?us-ascii?Q?DIYurW9f1Jz1RLBdyVupFng4rCa/2ldf9gUMupuMgzeTiRZjH1eyQPJ8ugCO?=
 =?us-ascii?Q?v/1J+8pO06+eQ+iikG5OHNHRsOUW7M3GuggZPYx8Mno2ZealjLAb+iJvVl5y?=
 =?us-ascii?Q?bJAs24NfblKCAQkmFy5O4oeeSxQK+kZGMOGDHLx9jMJ1g9fLZT5+jMexfERs?=
 =?us-ascii?Q?0wRtYuSrntpdm+5//Wn11wLo736Cdnl/WwSHikpQ7oPR0AeNpVURGZoqbKxq?=
 =?us-ascii?Q?cywZi/kB5H/SRnArIwjA+FizvE5cHmYfWOq4O7lMrnNvI8YpWiII/4DerSPl?=
 =?us-ascii?Q?npPn4tD/3vMuTd/ZNu0uN3yzTqtz2xROaKA2nlyhcvmujeF6zbmZivJiweMv?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8og5AvT+ziFdHUjPTNiyV0CItlYmh3pubR6qT7Mqh/abA7j7nGfKT6RxwjhEKyyynQQWvbupLJQUUTdCmE52cSR9J2E+7WTLvcOq7vDRdHdMs1NYtPDjtVSzmN4F5bvwMM2FcHr9vSz8DIf0Pb3as60ZHA1o6WFxNhrEwYAEsh1u/jKh38y1DsRbpyhVyCnXWRYhzdY8o21FVb7yazw/L9VGx4GLy+sZjQJBm8JT6uXunLVT2smmZXlR9qnr6a9J2VSdmOIX6KceBaY2dwWNXc3Tz/T0iY9IrLL/RC3c2HKk5ESrlPeU+nUyLiI1zhN5+mt4at0zicQiTw0EBnP7cqEBev9wdZTRR2iuiqa+k0aITcAafyMqZG/QUWTMYZiNCOi2d/NvuxVtCfoX0joL3QOWeWO3R4aiP/7kGGnsK1wx4SWOK8WXPYPTLoTAJtnq0twNG3/Z/ffs+42H8jETiXvBcMcvKwwpbm4nGLe2vHAQaGD67d0/K+VHTMTheYnYA1bw6pnEJhjyoXsvzQU/1bNo3XCEKayPLDu14s1T8bNEL0AbU/gZ4Wt6k5bd1yvlvOtlnNuF+DiJwbVh2+KHVnZUZvI+GJZ48TxDzSomBDU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f5ed64-920d-4460-2ae9-08dd7938aac2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:37:24.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZgwn9CzrNGd+5jpp23435XBIcmjtOBKMYdwGxM1HzrddKplXNm9AVzroWNyZOLHN8Hb9z1guYFFLKe/+5i/5PE+y0PnV1KbcQcnPa4rafk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504110131
X-Proofpoint-GUID: k8D5JLUd0X4oeJlOcsngwBYiBkLz44X7
X-Proofpoint-ORIG-GUID: k8D5JLUd0X4oeJlOcsngwBYiBkLz44X7

On Wed, Mar 19, 2025 at 03:04:55PM -0400, Kris Van Hees wrote:
> I am holding off on this patch for the moment, just to get a closer look at
> the potential cause (and some info on how old the kernel needs to be for this
> to fail).  I would expect arg access to be the problem rather than the mapping
> because the mapping is simply something that happens in BPF code.  That should
> not be kernel-dependent.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... because the affected kernels are old enough that it does not really matter
    much and I do not want to hold up a fix for this test always showing up as
    failing on those systems.  We'll keep looking at the why in the meantime
    as well.

> 
> On Wed, Mar 19, 2025 at 02:32:29AM -0400, eugene.loh--- via DTrace-devel wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  test/unittest/usdt/skip_arm_uek6.x            | 25 +++++++++++++++++++
> >  .../usdt/tst.argmap-typed-partial.aarch64.x   |  1 +
> >  test/unittest/usdt/tst.argmap-typed.aarch64.x |  1 +
> >  .../tst.multiprov-dupprobe-fire.aarch64.x     |  1 +
> >  .../tst.multiprov-dupprobe-shlibs.aarch64.x   |  1 +
> >  .../usdt/tst.multiprovider-fire.aarch64.x     |  1 +
> >  6 files changed, 30 insertions(+)
> >  create mode 100755 test/unittest/usdt/skip_arm_uek6.x
> >  create mode 120000 test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
> >  create mode 120000 test/unittest/usdt/tst.argmap-typed.aarch64.x
> >  create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
> >  create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
> >  create mode 120000 test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> > 
> > diff --git a/test/unittest/usdt/skip_arm_uek6.x b/test/unittest/usdt/skip_arm_uek6.x
> > new file mode 100755
> > index 000000000..252cbebb5
> > --- /dev/null
> > +++ b/test/unittest/usdt/skip_arm_uek6.x
> > @@ -0,0 +1,25 @@
> > +#!/bin/bash
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +# @@skip: not run directly by test harness
> > +#
> > +# Tests that depend on USDT argument translation fail on ARM for UEK6.
> > +# They're fine for UEK7.  It is unclear in exactly which kernel they
> > +# start working.
> > +
> > +if [[ `uname -m` != "aarch64" ]]; then
> > +	exit 0
> > +fi
> > +
> > +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > +
> > +if [ $MAJOR -gt 5 ]; then
> > +	exit 0
> > +fi
> > +if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
> > +	exit 0
> > +fi
> > +
> > +echo "USDT argmap not working on ARM on older kernels"
> > +exit 1
> > diff --git a/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
> > new file mode 120000
> > index 000000000..8d462f98f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
> > @@ -0,0 +1 @@
> > +skip_arm_uek6.x
> > \ No newline at end of file
> > diff --git a/test/unittest/usdt/tst.argmap-typed.aarch64.x b/test/unittest/usdt/tst.argmap-typed.aarch64.x
> > new file mode 120000
> > index 000000000..8d462f98f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.argmap-typed.aarch64.x
> > @@ -0,0 +1 @@
> > +skip_arm_uek6.x
> > \ No newline at end of file
> > diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
> > new file mode 120000
> > index 000000000..8d462f98f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
> > @@ -0,0 +1 @@
> > +skip_arm_uek6.x
> > \ No newline at end of file
> > diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
> > new file mode 120000
> > index 000000000..8d462f98f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
> > @@ -0,0 +1 @@
> > +skip_arm_uek6.x
> > \ No newline at end of file
> > diff --git a/test/unittest/usdt/tst.multiprovider-fire.aarch64.x b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> > new file mode 120000
> > index 000000000..8d462f98f
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> > @@ -0,0 +1 @@
> > +skip_arm_uek6.x
> > \ No newline at end of file
> > -- 
> > 2.43.5
> > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
