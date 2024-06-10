Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F4224E8
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055112; cv=fail; b=ksPhYDaKyPGGGqOkAqxWhqLnFWxjGHyvSE0NPj4Ub6auaggsg2M2zvZL3XdYn149UwAdMlJ5kyDNpQFXEe77n7X5XQhkyP7bl7vrNUzaXQ4yw1UJ4U+thI671O2oyQtnHlYe4zbDvqNZA2GIcENwd4HCF/YZXsvZHUdxp60ZILY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055112; c=relaxed/simple;
	bh=B73Pfc1WYYsD7TmmKFQ4b4ClYb9QzgX9mCoHaCa7Tlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ipz/t5WFstUm6PiP7dLF6Uv0eRe+WUQOFFNSPoWm3W7xWirYQiOqo3hjQUdGGRLnAO59VyKEPnjbEsyKZoA0LPXcY0Q/9Xk6Ke2PjJw3cb6tsX7Nyq2XggOY6bSVJxoGLidHqLBbiWJ2C+5ExEsnPPlZARsxmfxmuQw1FHzh3Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y7C1ZxV0; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E502DyqJ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y7C1ZxV0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E502DyqJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEMPl5029326
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=YP1XIplWxyEPnRDc8U6oF2Vhmq8MMHTO+3OsE1t1gTI=; b=
	Y7C1ZxV06WLj6EalwbzA6jonOqM8Vx7tz63PJfFyAGj19yZrJluwerDiX0iwR+eX
	9ZeODRFt/Iblx7bFLkXCvrDeNoZzZ+QxShNG7akTJm0T/lKTH6uGfuhJZisjXL1E
	5cxnO48Rc2vNGm0iY2AKn8Mks0H/lsJBmrk7O2Bx2e7WmgVSgkitovuBXkUZOz9b
	SnFee7l8mckng+By0ere3TfL23J+ph+hKvAgk/H2neTw7PwiRnhzZj5TiNhzIKFx
	y0G47Sc0n+qyJVmNKVwbD/GHKWlfDxp+yo795h8sRVBlHriEc9EtuAwewHinpJZn
	1FBB+Ydcok95OvBABlNxXQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7dkk7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:31:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45AL3c9f020032
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:31:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync8wc5vy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uyo/X7s2aXyM9dCAdpLU87I6ovv/I6/J0CqfjS0VqxyHrWPN4j/T2TOwVRNngD1f4+ZteQCOpDkuEi0zhPxZpfmHshcBwZWFMf9mDkE/1ZDR8LpRa3HLF70zdN5mocVxqxpgRDiBaulzWMP4cLEv67RWHvMZqx7AF7rviR7TKrYIBTl44MAoArMzc/MvlqaO8tLMWvDCWW4DotBXFM0uidXG/Apwy92fUQAd/UYMZW/I1KUDSxAeJwpLK24hoG5Tk4se/Rsb2FBxT6KfRgk38tsrJP1Wv839OJQSnhjJagfeYtLlMW0yvljnD4Ls6wPbms9XW3O31sa9kuTYK3lIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUMDW54MWxbKAmrqUBXKU2558RyC7//6T91vcaGWx7o=;
 b=jP7F8zBr4ASDnEPq99NossWJPwA4T5mDl8zNm3HB7UexxKoRlH0AP6ve8Uu1yA5IEcGDrDaMNNTRiXQ7RsO/IGrdFDC+3KXNyqNHnB8MemspPeLudsPKqrtRpkkfSVQ3xg8/gsQLk7RGY89SLo2JdhGTt+SsQciPI6efRda1qJeh7yw8APo+UVYHPRSu1ZiBNQFqqLpjWoqjq02a+HkO7mWHzqHiG4UYzGt9sb3HCWbf9nMoM2dcJO64TzZWMsTS/2DyyanZqraru2Oqoz9gy5ZoZnnz3DXrS8Pp3LQsVe7GjmZcfZSmpZblVGmomueu7G8i4PRVwLwBlcTmmx+u6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUMDW54MWxbKAmrqUBXKU2558RyC7//6T91vcaGWx7o=;
 b=E502DyqJc+8d90JVKGdshcXA+Tf8Swg/wRVcG9XTSmzP7G2JRU6xm9MJbR1bkuNHxXCWluzSib4sOFnU8/SkI7sG889v2l6PPrl7FfLGQMEs8MALeX0CHuiNJpvpIDOU2gne229qZ0c7kWpIOaSeidjW7ARRUwqH4PDdBV9cmQk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7124.namprd10.prod.outlook.com (2603:10b6:930:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 21:31:46 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 21:31:46 +0000
Date: Mon, 10 Jun 2024 17:31:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 04/14] Track uprobe provider descriptions
Message-ID: <ZmdwvlCzMyGqh3Rr@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-5-eugene.loh@oracle.com>
 <Zl+CwFHv6bSJTNHw@oracle.com>
 <c1d70ac8-ee5f-4b1d-9e8c-75075b18db48@oracle.com>
 <ZmOG1p6wPx77nc2q@oracle.com>
 <f6970d29-7a32-c9af-a30e-e00d53ccf037@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6970d29-7a32-c9af-a30e-e00d53ccf037@oracle.com>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a09574-1c48-48d4-84ba-08dc8994bad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?9inT7kHDLc2XuR3bQtNIp1TV5pu2iUlxE2Xtv1Eju6s/wMD5PJgbm12XmN?=
 =?iso-8859-1?Q?MxNU1MTw34f9dK7TGeDzEznLfhFcAeEj2WGkIxf7Bvp1mrZJ0snDyGRqR7?=
 =?iso-8859-1?Q?WVhiFRUdM4W+zg+wJ0HTkDICmihOlNq/X5/F/jK5OiPhoOOCz3dQtBP+pD?=
 =?iso-8859-1?Q?EusKBZGQIpeVkkWmoW6xd8Vd3cre2EphzbqM4MIGyNCfu1RnuMARF1bBeG?=
 =?iso-8859-1?Q?sqPWMQc3Jy4nk0GFBtEj7a609PmEifTXGrta9TQnoermzt+S6uZTZjT13k?=
 =?iso-8859-1?Q?QIJaPwUhX3vE1pj0labSVVYhPkbCQ6wcpfkHH8OZY0QaVJd4LwUWheXq8S?=
 =?iso-8859-1?Q?gjU241VaGBlNEwL5OD4yIgTpMQHQ3VEZBlMOi0x4jk+i6/phCoR5/oPqfM?=
 =?iso-8859-1?Q?TD3j+9t4B/CYeJE1SmrJo8MeTr5dWZOR0isCvS5k6u/ie2nq9fpbgynhrK?=
 =?iso-8859-1?Q?E/vQStieKOF0LyAZB5bRWVxfbyZprIFio60rWszI+bZ0vA85xY5gsvdbV6?=
 =?iso-8859-1?Q?ICJUX3qAwvCyeoYck371KYhrgFy+U9Xp3v3GnxoFn9bhvNY3LaG8EBaWPx?=
 =?iso-8859-1?Q?yCAWrOjwXWRDa4sf1GKK9ffGuFuwyCNd0cQ71s9D2PzWalrLPjuE/XtxaO?=
 =?iso-8859-1?Q?257bCNqCoiX+94D4AMX+yLg7qTlft2+8f9yimqF7mx4rFIZ6CA0oBZZ+5E?=
 =?iso-8859-1?Q?RFdvuTLuyYkVRIXWm3sTspBY1pdR0Dzh+DbRZvH7KaO3ZQ4sr+bGSIxhRP?=
 =?iso-8859-1?Q?TO1LOhJKT4xyV5iF4s+hrStYMa+X6Ukj+vV0GvyotEA3EIu0Wmc/JcWNJA?=
 =?iso-8859-1?Q?Z0D3SYgVtloh2iWvCoEbblslrKgf7rF99hzA/v8NDNkWZnYjldL1oAGKh8?=
 =?iso-8859-1?Q?BziuJsVx6syGbvJWG9wI0ElV/tB8kaGKoU6jbLAoovspy89oGpjZlp8rpo?=
 =?iso-8859-1?Q?yq8m4dqKIjA+d+Q6Y3IZZrjuE2u5zcvOssi6fqspG/BK4c0hrlpXsI5/I3?=
 =?iso-8859-1?Q?LiW+Q/YsTcAAejek1N3SmaZIObvBnCkVVSM7DOrmsbRWN9XNA5uJWRFv1n?=
 =?iso-8859-1?Q?hKXWax3fn338A6Iu3t6gBpikX7T4ZZayTOVGEREyOKvVexM01fgIHYQb+U?=
 =?iso-8859-1?Q?xA7YTK1Zae4KizIz5KXs7OwLRPqIsgHofIAStqsuFwPEXBwUpjmZ1j2saC?=
 =?iso-8859-1?Q?GDpPqO3NUc+vVGYCnlHjMsvs/R3RJhBGrtuzSjdNFlEdlQFOY9QYSzwhcE?=
 =?iso-8859-1?Q?zX5gI96bK0XiYRKxZ7MHtpSXZMtE+h4eUGEzMvBVzNyFNjeWrkL1piPBdd?=
 =?iso-8859-1?Q?Cqv7RrNgZHGbTlS8hH7mpziVFJjyuzJO+ErDr+5sCj3Ja6gbKpvLjNVYb5?=
 =?iso-8859-1?Q?HtbYjGxcUg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?tuXq6Ft2hY48Z6RjAckslxeF5DHKnjeIVMAocYinszmKe/KOynXuTDLchJ?=
 =?iso-8859-1?Q?7VNKpjlKAy79cgqpbkHm1+s9dd8x6jiaEGOJnlNxDsfFdf6QUxY4gSR9fk?=
 =?iso-8859-1?Q?mXO2hyii47mt0j+TrvuQ6PIahVCxrTYKsP6SoxH7xOVUBzBEbQlDPzr5EN?=
 =?iso-8859-1?Q?2DIVhiu84n4td9u35Ru29PH0I6kOfsIZUi+BIbyS1W1zK2z4T3k3SpCCtG?=
 =?iso-8859-1?Q?KwzCMwgWa4WLtPu0q1MP6GxV/udkGqkgFGYSB1ScV6/GyCy6V3k+C+tMkL?=
 =?iso-8859-1?Q?uiRkd1AP2+vTIfPa+deFKKzZhiRUBHb5dCly5ua0evk7K0Gk2SfEJOMMAF?=
 =?iso-8859-1?Q?tvd0VpKlNl7baal9xg1Qhr7Cw4WBDP8Y0y45+t28BnmY6dzHiArNQuyvWJ?=
 =?iso-8859-1?Q?xVwk4JGZUiIveGxN/E+ee9MVEtXgsfeilcuLrhMPfMC9U4UuVjYcAyZMZf?=
 =?iso-8859-1?Q?V8cBir6fdKUHy/yDSclIy/5KGeUgqiaj+D/j8P72hLz7dzW5DLMV8cr4XU?=
 =?iso-8859-1?Q?I5OSqgtoKstrKiSFl4Gp2AhqqUYX0AdQOCgl16WxtEp3qpysCS7ADABpRm?=
 =?iso-8859-1?Q?/uEqFI98Aj6Srw6XExpQVUMIpcBQIekOABMfDIYnX7FaZqJ+dzwHsjnDcx?=
 =?iso-8859-1?Q?BQQUp365HO4p7bccumxXLUwfvDNuHaaOsR32auWMTZz9duaBx5wmoLSY7T?=
 =?iso-8859-1?Q?L4EiZuajL7ujCPLRY22QH9Md5aymzUFYOTgxWwQ4+yPNPRMdsEK/JzBdGs?=
 =?iso-8859-1?Q?qdCB7YrjYq+hAVARdZmDq6KwvHvS3zclVd+vFdN8mqKk5ckZzgEfyvu0MF?=
 =?iso-8859-1?Q?FXsbEvYlD7r4Z5V6Kcu91RHk42/n0gzTGp6gIbx/Qy3dls4JlNEcKoVsuw?=
 =?iso-8859-1?Q?iGKaMXjhZpd0SAGGFXeqIbqn0gXKPgByN7ReAMkibXKwxdm8L2Y1OPJkjn?=
 =?iso-8859-1?Q?F7h+Jj+XiTuzMVJuIIqgVMWznIwcoePoBMlXpNuitVAgeJd2a71Z1N+weH?=
 =?iso-8859-1?Q?bqSTCNPDr4XXST88tJSAFJrqELTfTwI44FPXWeGo0sokf9AGPO22ZW47F+?=
 =?iso-8859-1?Q?9ODdIoPIeMdSW1Nm3qptdGDptaA2N8BlcIsMLC9uperMTERRlsoraxZTlp?=
 =?iso-8859-1?Q?9ka+xx460ljuCzqUXr8sEFAgjKYTBbphEMWCCg+PEa9zLHxyWrsLTkYhTL?=
 =?iso-8859-1?Q?44GKVn4eqhqRdrE/S9GtHt0dZWzQqF4b7AqS8rR2EMwl4c5hOvwpErl2hz?=
 =?iso-8859-1?Q?iyiSZVS1UzX78I3pwZ/3SWML2BklmyHzuL7XzAlEHfxoBVdo+UZe4A/eXK?=
 =?iso-8859-1?Q?GiL5gwbAWZbagHGHwhYRSuL7NavhWzHY5jvrR+9tFtW0P+jioBlVDfepDP?=
 =?iso-8859-1?Q?TdIa7qicJdaqdW5qhLz4fkDXIHD8UmoerGnrbC3bdluvoKB3SUcq+wNo+M?=
 =?iso-8859-1?Q?ttVYV+5g3n82+ZCgrZUQL00yt47WWeawtXxhcsEJ0g+QmjABQtIZAe5Puj?=
 =?iso-8859-1?Q?7bpTZSMjp9NK35yILzsD2V58+12KVMEV4KFT7tlQXt+Uk+coLyMfBima39?=
 =?iso-8859-1?Q?xhA+0DeaRrf/jr0YMogKRK9jSzjs2tRltcKK1jkb5nBpq03DyDd2rd6iQn?=
 =?iso-8859-1?Q?W7TCDgXQb01SVv53/hFFfq8Z08zJs3Gk6BPE+ueZbU55ATz4sn2EZreQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DuVS8+M6VcJXn9F4wjDSYZhaUFOM9FEQgerGbDhHRqIbv5TKLywj+DPvvaSluURfkkE7+CdzVku1WZ96i+yN8XqNnqHUm9uJNmsxgkyvIM9JcANlS18nIKZiV/vzaWfTGv8Wek3VS+18vufexSbQxWeTetVaF48MnuA7BwppIu1KW6TV9Ou/DD/jHrOGrASjSDALlF5Ca3s5yAgCzekrLFO+x/S8qN1/RWciyU3fYZ+IfYeqPti0HIrcxrxDtzjVMMPJGRfRmzTXucDmV+fe2notL08iBVWQIQwrkP9KXeeO/WMn324YEQKX1kl5Io1AHdYTRiv2Xz8MNGGtHhp0+pgp3pqZk2k5GWyqILz7Lo8I7Ah3vPsKVmZU/u8xx9zE6NOqvh7gV0xsVPbc8Guil+Msecc7jBDXGCOp585PQBYIl5FvWCi377fb6tius2AxFWwOHcfpd033Ckv+5loJQ/zPv/5xVebeZzoPPP1Ul1PsPzd+cMJhBRE3/ga64G+6U45Peyv/VmhLL6WYgEsUYUykRVx+eObh9fwfrR1sBdhSkuf8W9DBsNuOgkwEIp4Tl+jBYRgeZ8Au72jgcfSeMYf/cRdxqk8J5QIDhIc/7fc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a09574-1c48-48d4-84ba-08dc8994bad4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 21:31:46.4441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML7Lhx8Xt2Ulgm5PEmeQs0F3s7BuKKP1KpTk5PiDu3tGMGI7wELVxs23g6zs5Grl7rRmMyS3XHuE6MCkSHHwq9/uuoAyrlZ4mvKoyp3pULY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100159
X-Proofpoint-GUID: INdNCS1sJUlEWHH00wmWWPIla-xrcC-t
X-Proofpoint-ORIG-GUID: INdNCS1sJUlEWHH00wmWWPIla-xrcC-t

On Mon, Jun 10, 2024 at 05:23:48PM -0400, Eugene Loh wrote:
> On 6/7/24 18:16, Kris Van Hees wrote:
> 
> > On Fri, Jun 07, 2024 at 05:40:51PM -0400, Eugene Loh wrote:
> > > On 6/4/24 17:10, Kris Van Hees wrote:
> > > 
> > > > On Tue, Jun 04, 2024 at 02:11:03PM -0400, eugene.loh--- via DTrace-devel wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > A uprobe will have to decide which of its clauses to run for a
> > > > > given pid.  For now, keep the provider description for each clause.
> > > > > There are many shortcomings to the way this is done in this patch,
> > > > > but it is quick and dirty and helps us bootstrap real support.
> > > > > Clean this up later, probably turning it into a growable array.
> > > > This is the wrong way to look at it, I think.  The underlying concept is that
> > > > DTrace supports specifying probes that do not match anything yet (-Z).  Those
> > > > are called retained enablings and they can exist for more than just uprobes.
> > > > So this needs to be more generic.
> > > Okay.  I looked at legacy-DTrace retained enablings.  They seem to be a
> > > linked list -- (mainly) of arrays of dtrace_ecbdesc pointers. And
> > > dtrace_ecbdesc has dtrace_probedesc, dtrace_preddesc, and dtrace_actdesc.
> > > In DTrace on eBPF, dtrace_ecbdesc is much simpler -- it's really just a
> > > dtrace_probedesc.  So it seems to me we could just make our retained
> > > enablings be an array of probe desc pointers.  That would be a small change
> > > to this (small) patch.
> > > 
> > > > We also shouldn't do this non-discriminately for all clauses all the time.
> > > > Obviously, when -Z is not used, there is no point in doing this because there
> > > > cannot be a match-after-start.
> > > FWIW, that's not how legacy DTrace seems to work:  there *can* be
> > > match-after-start without -Z.  The -Z option only addresses whether there is
> > > an initial match.  If there is, then -Z is not needed, not even for
> > > subsequent matches to work.
> > Yes, I didnt think of that.  But -Z is still relevant in view of the stuff I
> > mention below...
> > 
> > > > Even when -Z is specified, you might be able
> > > > to determine whether the probe specification for a probe matches perfectly
> > > > or whether it needs to be retained for match-after-start.
> > > Maybe.  But what if you have pid1234:a.out:main:go, but pid 1234 has not yet
> > > started up?  (Yes, that's an extremely weird example.)
> > No, when a pid* probe is not able to be resolved, dtrace flags an error:
> > 
> > $ sudo ./build/run-dtrace -n 'pid12:a.out:main:go,BEGIN { exit(0); }'
> > dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12
> > # sudo ./build/run-dtrace -Zn 'pid12:a.out:main:go,BEGIN { exit(0); }'
> > dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12
> 
> Hmm, seems a little strange to me.  I do not understand why the pid provider
> should act like that.  With -Z, why not silently ignore probes that aren't
> legit or for pids that do not exist yet?  Anyhow, that's maybe not important
> to think about at this point.

We *may* be able to change that in the future, but the main reason is probably
simply that DTrace needs the pid to be able to resolve the rest of the probe
specification.  I.e. you cannot determine whether a pid offset probe has a
valid offset without looking at the instructions, and for that you need to know
what object to look at, i.e. the pid needs to be able to be resolved into an
actual process/task.

> > > Mostly (going back to your "shouldn't non-discriminately" comment), trying
> > > to decide whether to keep a probe desc seems unnecessary. Just keep them
> > > all.  They will likely be dwarfed by dtp->dt_probes[] anyhow.
> > The issue is not space...  but any retained enabling would have to be
> > re-evaluated everytime we need to see if there are new probes to be enabled.
> > And this will be happening while we are already tracing, so avoiding needless
> > matching is probably worth it.
> 
> Good point.  I suspect it is not yet important to identify all the retained
> enablings that do not need to be retained.  We can start the implementation
> with all of them.  As we think of cases where retained enablings do not have
> to be re-evaluated, we can teach the implementation later.

Weell, retained enablings always have to be retained because processes can come
and go.  If it is known that an enabling is meant to match future instances,
it is equally known that such matching may need to be done multiple times as
processes come and go.

> > > > So, let's put some thought into designing this in the more generic case, so
> > > > that we can avoid going down a rabbit hole that gets tough to recover from.
> > > What do you think of:
> > > 
> > >      struct dtrace_hdl {
> > >          [...]
> > >          dt_list_t dt_enablings; /* list of (to be) enabled probes */
> > > +       dtrace_probedesc_t **dt_retained;
> > > +       int dt_nretained;
> > > +       int dt_maxretained;
> > I don't think you need both varoables.  Just keeping dt_retained_sz (which is
> > your dt_maxretained, but made consistent with dt_probes_sz) is enough since
> > you can know what the last entry is when looping over it by checking if the
> > element is NULL.  There should never be gaps, so the first NULL indicates that
> > you reached the end.
> 
> Good point.  I simply was mimicking legacy DTrace, but that's not necessary.
> 
> > >          struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id
> > > */
> > >          [...]
> > >      }
> > > 
> > > 
> > > > (And whatever we store the retained enablings in probably should be added to
> > > >    dtrace_hdl_t after dt_enablings.)
> > > No problem.
> > > 
> > > > > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > > > > @@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
> > > > >    	 */
> > > > >    	dt_cg(yypcb, cnp);
> > > > >    	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
> > > > > +	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
> > > > >    	assert(yypcb->pcb_stmt == sdp);
> > > > >    	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
> > > > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > > > @@ -310,6 +310,7 @@ struct dtrace_hdl {
> > > > >    	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
> > > > >    	ulong_t dt_gen;		/* compiler generation number */
> > > > >    	uint_t dt_clause_nextid; /* next ID to use for programs */
> > > > > +	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
> > > > >    	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
> > > > >    	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
> > > > >    	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
