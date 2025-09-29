Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826DFEEC3
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 00:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759106779; cv=fail; b=eANsCDJuaJuadgA9sG6UCbkyJCeT9qi3Oj3gmA91u08KGDYf1MJ1J5uJWu6Oey3LmHDQztRm4g4g125IKsSNYBlvUZfFobv0zc2y1gIJh8STIDVofXpsaG8eEb8z9ufS8Cr5Ti9ORxkCQZ3+Hsipmi5gDVpm0QAeBlOhPHioX/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759106779; c=relaxed/simple;
	bh=hfdXaEhKhLwQ4fcQoDO4X2SJsseLFjJp8HVGCUGo+cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g7/J47IaqEPDyX1DNGuF7xtaMrLSvciH5Exi5pJs51W1I4E4Ku1TpLrO1vi8LwwtotYjhe09MJD9wUSsZi7toUa2Qa8a4kwdYZwyMa9cxNXeF9pUDg/S8lko6sc8vHpZ1TE9iK1Rh/UjMNjLQVo8VqTGMx7koIKjOU6ozrWqDDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hiuiOgg7; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FbHGsJw6 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hiuiOgg7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FbHGsJw6"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T0dgJ8024664
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 00:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PWY7j0K9rRq4Mmx2+ydDoIeJLIJcziozyup6lXtSJ8E=; b=
	hiuiOgg7IAlNBzhD5bxkOHIHBneZmRO/uJugzl9s081Xw8Sbdh4xAjwgnkreDQnF
	eu0qf9w4ITJ9a9evBRs+GsZQ6xS6Md+REhCHLiLHdqvlicqrYIymEzijG2iXYIDT
	2JzDwMqu1whFy0vSyxe+uraObqgLGyXZlzd7+VEgYe4eX0mriblLNYydfhruDJbw
	FFW85SVOXI8ejigfbATHut3D/EE6mOyfyYxpVM1qUBTKJz9+3nRfHc0d6QcL9sXa
	qLJjsnaK6+/kDT/uOcWekhDh9f51dbdQSAFyUieqwqX7xWLCuW0WfYBB85INIwyV
	o/vdWD9dkbxiEvSRPaxUCg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ffru00aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 00:46:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58SK665c027470
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 00:46:09 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c5s3b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 00:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jveKAKfhqJQ+0lvEA3UvZZE9S4cqQ07T9bJdonSiDpuLRaICGnJ2dZ1yGOiDMjG0Msnu+grts9M2ZvvwPMVtsg1qDWC7rzXyTKblXJKgj+UzHlg1800mdlNkRXCqRTAtTF3lhMe1TGl0mKbdSG8u5vpcrZrCbGj1SddQk3AyDM9YZfWumhr+1jaYbZd/18qKa6zcFkrCtnNB8tRYntvY2YgUZ9XYOsNGmIjQujGgOTxe2BKshisO9WXBJHlbuF52TPaj+GHFQywzuLVSFHYayUfvNEjShzXia5/7+Cg6wiw2DwNS/FYrCa2bHDYDvPOf+5MH1jRCw1riITOoCrdl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOuIXiT5BxFKMhG/WXGRjghX334Ia0glBD5Utate4G0=;
 b=ksxgbdNnaLAxRveAwpTy/K2wgtXQft9YDWnp9Nt0iHQSKbTbhEMwVqeJEag+1ARMZvZ30yms+YFjKsxtmcTRstFWNNZHrc+bgaHSf4pgjwVW3UjVH/HxVU7Cf/UIg/o/wssCzwUkjNvurTRdn3SHCDpCoAcOTc7VtrFigdEKdQjuQhfXL9wOLDDzETSX3c7X+5eWl9cd6DpichysXvifo3Pn1vkrONhoiD/SADgJg9rrhWjuYDnps9kchxGuFpWwukMig6aPuwAY1VYNRBJMxi5gu8Nieupu3oM6RkQQbfEU5yvKiw1Iww21DO/Wz9wvYYyh2J6MZ5+YPphSI8eK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOuIXiT5BxFKMhG/WXGRjghX334Ia0glBD5Utate4G0=;
 b=FbHGsJw6oL5f0sn3bbYX4Xg7JIDhS2jv27QFCHZGC53I7m1EyIU1OwHiU9iGvnwj3JH9RiwQZCt0BEiAaKZiT6Z18IjjdSwBIjck7kAF3poSthX6v4MFlBr0tjcULSQ1hmLmE5V2Zix1lpL9vP0LtkrX3vmUeRw2g3SEAMzMjLE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW4PR10MB5727.namprd10.prod.outlook.com (2603:10b6:303:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 00:46:07 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 00:46:07 +0000
Date: Sun, 28 Sep 2025 20:46:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Unify the handling of stack traces in the consumer
Message-ID: <aNnWzNX+DsK0YynC@oracle.com>
References: <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <dd3f36f9-af02-7cd2-7d05-39c9250fd89a@oracle.com>
 <aNnEMAcUWAHHayGU@oracle.com>
 <8711a6e3-d20f-d4df-91ab-7cc3d7e263b8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8711a6e3-d20f-d4df-91ab-7cc3d7e263b8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW4PR10MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: baa0bcb2-b00a-44a2-ab9d-08ddfef1936d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?e+5+dx2gdnM1zarmiJnWa6Wns0tsyg9Xr3gI/WPMBaZ/nHHH1H3ZWdQ3gJ?=
 =?iso-8859-1?Q?uDN37c25WzZYSYBZBd2sSJdq+MH1BIEZnivf8i9P0asL07XL8HpS8/3OWE?=
 =?iso-8859-1?Q?UshiLQh27IOO+Tb9ElShreQHORqwIxgXp6cmyLrQKWRB5tJfwyYAsaXf59?=
 =?iso-8859-1?Q?NUILBiFhSTWtoM60y1MzG2SEutMKEu6r7TEDyk2FJTEbd7V1yBbwkcd0mw?=
 =?iso-8859-1?Q?sAo8e+YFl7FiHFG+HcTG56Y96DXJtYp+u+JSGfLQozlz1jKa9/Byp158LR?=
 =?iso-8859-1?Q?/u+2zPdgUE+DcNjqS3B8nW0VDrwlPMPx+i227EAkQEafno1aeBzkou/GPs?=
 =?iso-8859-1?Q?ype++Byb1kJk3yCj8WJ3jT0CjoYKpZ3wGF0UjFidvDAqWU860VpUfitXfp?=
 =?iso-8859-1?Q?GW+PuxEQqzcxTJukwPPnrEIRKOwi0XWwRg27oeEHZ8GAr7uidbnOBPfRdf?=
 =?iso-8859-1?Q?XSfnCqc7NlAdERBN0WaBcYlxduzbWIMS+POCECn9/KbB/c5mP/vrVXJsUJ?=
 =?iso-8859-1?Q?34iI5pDtCz6VKY391u240jbvwMG0cAT3Vdiz/l1hl2trQoTXECsJjvQykJ?=
 =?iso-8859-1?Q?e1ty4Sd+DDcQU4lVc6F3BHLXmyBzyok5yRXyxAI0zbXc1fvaDg0PlYp6OG?=
 =?iso-8859-1?Q?/5EDWJdTK9Pez9LzhEh3+eW321WDrTgY5IaccIAp6eYOwY2sP9BEZZAfXK?=
 =?iso-8859-1?Q?z04ltUf8uZPJH/Zq20bUBPjUCjtbrHNKkExJIRcKq0Q8krYx7Pf8lXPE0D?=
 =?iso-8859-1?Q?zIzvpX7WCD3fSzmizC9R94GLLpVZNZYSYFC+YLxjSNXHPr620uUL+s03iH?=
 =?iso-8859-1?Q?PfRFwxbhh4NqeDE4CIQiOK66Q4QrrRTDLt6c0mA4EYIohUVW6EvrDjtq4n?=
 =?iso-8859-1?Q?A5RQW4c3PH3k/WsusMaqptd6bAeSdlYlHWktdpDgd+CNki/Bt2iS7iGmv0?=
 =?iso-8859-1?Q?ImPqmcxtrsO+EsDfBwMJdYM1L+fc2ex0dDMahub/h3BrY8eHEZEhg3w+yv?=
 =?iso-8859-1?Q?gtZo8kwyTNzGK4/FFtx3r5tOR4kguTJ1DQporqPrGpV+uqpoyMvmU7AIoY?=
 =?iso-8859-1?Q?kwTE9gFbnbkQg9Hs7q5P0EcNe8BXvHIiDRR/pFRPmCVsQMJyUjnY5TBLCX?=
 =?iso-8859-1?Q?idg3SA2yJSJmvP/hZdl8MbviOPdNoHKaup0s3fh15N1ixgpwbNlgcXr87b?=
 =?iso-8859-1?Q?/aC7kY4alFv57FV7CgzxSKQb/X6v7zikZoTatUMHL0nihO+1bBQMP/6QlU?=
 =?iso-8859-1?Q?OMFXXMgVfc/fpp3sGI4Qyr+/l7F2tUbiD225hsYGovHV85NVaA7kmmRjtn?=
 =?iso-8859-1?Q?/D3hTywDieRSK3nN0PtfTe/Ee3oXUF60r0SMqXQhlw9cixaR0eKWGnFn82?=
 =?iso-8859-1?Q?lU3GYCLXsAchge1XNmQKaTTBn9lDAvZkhefRUI3G8g56hU9ajv+bSP9T+R?=
 =?iso-8859-1?Q?080qUWiaRRVS3Vqm/Klk9HAZroE8/WvWu2c3fyFCRjwohaC1ha2EbqN1oX?=
 =?iso-8859-1?Q?GS81WF261ENcqteWLpLIUp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pXk/R+DAGr1kC7jF/0PbJoMfpbkuu6xblpV4KLPpSCQwpQksWsCXWfrKuA?=
 =?iso-8859-1?Q?CcL8uWsHzfY/Hhqed8lZOcc6ieOpiEwdw6Y2bzQnjAlIciYZKmKXUELgTq?=
 =?iso-8859-1?Q?n3I1oZw7MRwK0FnwOZcudEzy+p8z7fkkRKcpQITOYKzPK2/ZZTOAkLyKQT?=
 =?iso-8859-1?Q?O1XKLlobupgmM/mUiVYJ0uyDuIQCiyS1PNA+Im8W8qLeNjxaWoJSFxJPdF?=
 =?iso-8859-1?Q?91hDtjAZ5KySGMac+geTA54RrjtNOxElyiABoMsvmLJGUYgp7LE15+2Usb?=
 =?iso-8859-1?Q?wZoIQsDu0kHOnzfc/N/hVfzxkhwtu8yKTh+3uzJ+dxPfBSBfaTzt9DH5jf?=
 =?iso-8859-1?Q?Ain+v63L7AcXMaml2yHg9KorJwpUhEh/aLugCjzcohSeH60axNOlhlpX4R?=
 =?iso-8859-1?Q?lzPJGaOFCA/aAoEAr1AdoVxVCAyC++Sdcn29qO90pUCEAle8bqnLB4k5DM?=
 =?iso-8859-1?Q?EV5ZK6gYmj/g5KTlE8YwdL6ydTFYS2nrR7gg9O/2mLN/3NBTUIN4EiOu1c?=
 =?iso-8859-1?Q?yMWTFS3cCAGFOMAGQU2uAywm7Kql5m8Ah2xhNuPauM44TN9vy7nWnGMzs0?=
 =?iso-8859-1?Q?EOpth8hyYpDlTVTIhNKTBNm0qvl8+o38MvY1/619JYSYzj860rOnmi1Rm/?=
 =?iso-8859-1?Q?mm1rNM7nx8io/8Zj9IqPF6qRuKfWmqFO16byJIaFlPSAd4A9CBQrI/9xdE?=
 =?iso-8859-1?Q?nqWZdUBtRQ5OW+Q2wLmH6pdxhXcihwD/0bPu7cmbxxk55B/hQVWwhexYEb?=
 =?iso-8859-1?Q?dVYp+YGI83RsgjE5Upg3pEAgvadXh7emecdT5GqXkEOZunEOsIq0a+GmSx?=
 =?iso-8859-1?Q?g1iAYvEyVlridvekRCqtfHop0F3bFRIHpFLInVL8tKz22Uiz8xuAE9YlIv?=
 =?iso-8859-1?Q?q0ZKKltmVfoAU0gw0nWMwyUowH+jHROgaFMfUMaesd22A2F9Ui8Uk0aqoh?=
 =?iso-8859-1?Q?hMC7jwx3fQ+UGEnekZcSOFps/IEBoZlabqlldYr7hlZdsESQur67htfNN0?=
 =?iso-8859-1?Q?nbXEEt2OTbIimJuRcjKhQS8NXzyHLLXd8RLJmtYeWF2hDk+2RDxT4oFzvp?=
 =?iso-8859-1?Q?O2ranmoPjNNVUAU+b4FEtUUornRLSYeTAkXB00SGJ+tHEC7ngY0gAUSaO/?=
 =?iso-8859-1?Q?OtdruOLKREepUoRAO3I3/od1s7nBM2JdQUTWvjX3Bmk0mWFzPz3Tj2jouk?=
 =?iso-8859-1?Q?GxxpBjLp1tPA8KLfJSlXifWZdCnBGaEmgAk7NQ8/BkDuA/ildQSaayiITP?=
 =?iso-8859-1?Q?19QYLKFhCxFKwQH1Q271hShgPqVqIa7CQyD9k0AmAiwbNnnIPwO9rcrk6v?=
 =?iso-8859-1?Q?Di/8ej49R79NVkRPhxTz1a8gL5o6OOxkjP6YNzKhbhSuRCv3ffnbZ2f9HG?=
 =?iso-8859-1?Q?Gg4rhneY7CrmSbIhav2UEuaUb4/2Yblh6DKlcvZshurdxIB2xJlRcqQq5O?=
 =?iso-8859-1?Q?pGOmjHhHSgArWaP13Z9BAGH2zIR/57xvrDNEZkeSa6Hm3S8Jg/ONX9/Mlj?=
 =?iso-8859-1?Q?mqUr8vbMOtbbu4NSk5C1irjy9x3J3e7QoobkmSn8I6nktUuCFfc3M3KblD?=
 =?iso-8859-1?Q?qTIsw3O3wHkHOgJQjUG4bLx7xk8OvjxZUpkYNAvi9uVMGwjW1+TGVqlgUy?=
 =?iso-8859-1?Q?+bhUMK04sKC8j9h1grU/wSXbLQGJixc7gQ39HtxEvnrwx2t6Rl2Tx64Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T4AeVQYBXmF7eo6O8qHm0SMOYAA/JMyRjScTK/uUEavDb4C9UwmjNZ5uIMzrvzEqCd/77+chiKHcHHQA/8RQJACpasi1F5JxYdFaOkLmeskGIk6XbljoTQWuxZArmndMLwMmhJ/xMl8qPujglrcblR9zmY5NVWrzhXV9eXnDwYdxlGpFTuuc6xbSVvqQUxcTrX8I+UvzroWlrQudKvufc7QuzuZZK3nvjoW5V0W7/3y2QmLaJqtBXcvYxBlcW5LyZQ9XrpSKVU+sxmjlAMbv6y5WTLdZ2jzYfIygylrU4B0EgNc01uILDz/wftMxkEimU5ffDHlFG24ORtQSJznErpwyBEvNLq0ysxhiBvyd21u4JdePkKBC66apwMK3HxtQg3OiR5U7oCwIHsfZMUm4Zdl6R4zTVkCF3581MXSe9wR+3TkgqOEi1YH5GWAJcqq/VQD6STzI9axmckcwTqMxyv4DuDhXo3ZXAGfboXTPlFd3cSjooHjGC5UkvCqWT0wbVVepxRzuB6a1Wfww8815EYxTyCCHjsLmCoxSWFMJOyn2sXKiN1IelrTqwwsewcHfXU+wnPUmAvQELTISQLuXcWA4GxiNs0dxt+ipje8s98Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa0bcb2-b00a-44a2-ab9d-08ddfef1936d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 00:46:07.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYraxJ9wohQtagL/mrT36THckxdVr85loZx0e6De3+F9u7ut9YM+OJxDsyHVSZbH9GqjLDXQNk755ClbCzyMOFTjBfuz2hiNutknONFpnMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5727
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_10,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290004
X-Proofpoint-ORIG-GUID: SFUho5NJ5-2XzKTUybvspd2IsgnpLVsu
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=68d9d6d2 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=Bj3dLeoLOBVeXuQmxfgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: SFUho5NJ5-2XzKTUybvspd2IsgnpLVsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDAwMyBTYWx0ZWRfX+IEeQTwq0umH
 HIKMWRE771F8FV/XbGRtdF0oomnmhd3CVfcVPVeG/MH1dw5bY3r3u795kAQ224wvIn4fR2QO3iN
 WSB/tObHBq0EW24yMIVbdO0aCn73s2+egVBie10hTTCm+YGzlrIlJkoX458DGGzrjgM/PWp8hiu
 nzun+1n1Bo+D6g1r2FFiZa2LgdjbR4N7rReUujtPTMLvPq4cz2Pr5iLGFedtM+86ZBLTOE9hqyL
 ckIC5CE7wXkfC6egtItQCcq6AsplXiGfzOfDCIo3r+YglmxD1Cv1H4U04nPanor/48i1U3wJtGg
 ONOAhVq/QhlrH+AEitI8EF3ahIWV/UeQf7rQwq4yENCBl/EDSutbDlBKh809gv7N8W1mGwAwKYC
 UqMpRIUuGxWbso+mCqS0pdc/1hhFCA==

On Sun, Sep 28, 2025 at 07:52:52PM -0400, Eugene Loh wrote:
> On 9/28/25 19:26, Kris Van Hees wrote:
> 
> > On Sun, Sep 28, 2025 at 01:50:02AM -0400, Eugene Loh wrote:
> > 
> > > For kernel stacks, I guess size is always 8.  Could mention that? Also not a
> > > big deal.
> > I am not sure what you mean by this?  The size of the data that is set aide to
> > store the stack trace depends on the number of frames that is requested.
> 
> Right.  I mean the size of a PC.
> 
> The code used to have a function
> 
> int
> dt_print_stack(dtp, fp, format, addr, depth, size)
> {
>         for (i = 0; i < depth; i++) {
>                 switch (size) {
>                 case sizeof(uint32_t):
>                         /* LINTED - alignment */
>                         pc = *((uint32_t *)addr);
>                         break;
>                 case sizeof(uint64_t):
>                         /* LINTED - alignment */
>                         pc = *((uint64_t *)addr);
>                         break;
>                 default:
>                         return dt_set_errno(dtp, EDT_BADSTACKPC);
>                 }
>                 addr += size;
>                 [...]
>         }
> }
> 
> (Lots of code redacted.)  Anyhow, we feed in a "size" argument.  The ported
> function is
> 
> int
> dt_print_stack_kernel(dtp, fp, format, addr, indent, depth)
> {
>         for (i = 0; i < depth; i++) {
>                 pc = *((uint64_t *)addr);
>                 if (pc == 0)
>                 addr += sizeof(pc);
>                 [...]
>         }
> }
> 
> which assumes 8-byte values.  Again, no big deal.

Oh, that....  Well, since we no longer support 32-bit anyway, it seems hardly
relevant to keep code around that handles 32-bit PCs.  If we were to bring
back tracing of 32-bit apps on a 64-bit system, we can re-introduce code for
it, hopefully in a more clean manner, but that will require additional code in
various other places I believe.
