Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB4119C578
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962015; cv=fail; b=Hnhna2FN75EBNn1ZSVEi1KWdRVNBCjVn6O5UUhVuCn/ClqwpTsHJMhRCQMQ1ul+0nEQb7fSjD2Wp3e5ELOLAwPnNUHbao74bQvldGTUesxtpAYi1bgVdZCD8Ym/Ylm6X8fQwib5Ostre2SHIpJe+RsTnsI932Y9BA4YWoSWh4Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962015; c=relaxed/simple;
	bh=Zj1c6bdJ7PY94LOi0OrtvsTTItktrxv+OufCWT34SFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X9VvVhpPst6VDbfxtHdtx0BjzQp8ic5DI+Xo2zlawD0BlP9FwenmqrFWpV30NnQGQNKdzHfdgvIaO1hzabJqhTDDDiYxEIDa4TfGk5jXuLflat4VJn8FV5GyiwxDVrI6fdaibEwGiFkP1n7lTV2ojVVtZRZLMvgzLCWEayz1JnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UxnKOHGa; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mYKqWUJy reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UxnKOHGa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mYKqWUJy"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517KXosh029041
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 21:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=O/V1A3HNpSAY9bRc7jrcHafngfh85C5Ek/9r7Rg3EXk=; b=
	UxnKOHGa3HRfrmY5gVvJwuKm99M63uT3jDNN0c3D2HWGdLvzd1Uj5ilcuRWQem7W
	AXdtP8QUG0Q5rpgVi0zj/D6yd0JMNL++vYmp6d8sqq9ibOLZB5iTygaGznYLbF1W
	0tBhkXRV3yVs2zi8QDBGcOAsW6ir0GJkfqYi3NSj5vz+IgWm4Hee4SW8VPkq1w/x
	Xxov7xVqeeBsrPj+BKejscViZUgntcxYCELCVbgJ3EuYQronkBRTjHqmv0lUkET8
	6i6Qdlzn1nsB6V5Ofz0pkTQ34WO9P0tyYKPUbXuFYa4a+tqnSjXa91OyX22N+ACo
	NfOuqYU1CRc3ddlXcmsgig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44nqb188gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 21:00:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517IwWut027841
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 21:00:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8ds14d7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 21:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByB49O4rm9gB7h6A3lbKhqLAUU1kES293c+BGaMP4/5MfiJntkyjvImtRd0+4R4jBvsOx7YodCwwGX0k/2SQEATZ0ozuxg1qfAmIV/vM9Y6VJBKxFoC01uRFi/9/E2Voe3av3WhGDH0nLNO7dSmCXrNhzJFzu0eybHX58Eu/z/iFMuR2gDzHR3bfPrsmEStsNw6+EQhUKnsiwgGTxPMGdm0EoxkwlUdq5vlHnfR652RQ8E4i0k2Lyd3lEO218cTx3LKpTlirRbEWC0sewXG7kOaqjDEQ08p/qdjLzrA7WBHe+8EPqe44AVW+RZimnebvAY5v9teAe1y8E2gQ+Dpaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqjQTgfib/TlPPrKJb1gwnJ/ZtbY+lttCvW6F+jqD38=;
 b=uZuavj7UBSyy9M4O5b2JrufqHSa6bFYnE107ODla3WU1VYyIi4Hk4bjDezgf3ew6VlCsfypIxWBVDY+/ak6HVHqbWAKq5Q0MAdd+czTIxdMjL928R57oBHM9opyuZAAcGzosSYpw/DaKUKD1aa+GyYXUnR8IVLWAPvIjAIXo8pnB5wEBSnMyuMlsuIKLCX53BDN72I5mcA/ASLnQXiT/BGDqJqh+qUoM4rTkNVzevo6VGm+XGejGQtPgW8Drmh8KtS/M7w1Zh/6bodIsyQIMhUpd6LYNeQl4bGVj5qCDq4/AmBc/IIVXoJiT9M7zGMaq235qlTK6hjnA/2A5CbGoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqjQTgfib/TlPPrKJb1gwnJ/ZtbY+lttCvW6F+jqD38=;
 b=mYKqWUJy5QgjZcuVaZ8jcnGc/jTJZGqZ1ZsZuhHbF/aEFRAPYL8qspqu3uBSv8H2p+YYHSuDugD+GpsDiERbZWd0+yrdVs6/X6URfQ0nZu7cd/fLHcMtZtV4Ted9CHgb0MEpMKZCqRIbhpDGCJBvflBegBOpb8tcsL2SVcBSwJg=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 21:00:07 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%7]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 21:00:06 +0000
Date: Fri, 7 Feb 2025 16:00:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] cg: ensure string results in a ternary are padded to
 strsize
Message-ID: <Z6Z0U8E5K49Brw33@oracle.com>
References: <6c5f5a2593039303a8f1f46fccb7a198.kris.van.hees@oracle.com>
 <495b1606-caba-9b59-68a0-0587d0ddf094@oracle.com>
 <Z6ZriBgNqjXqOm9Y@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6ZriBgNqjXqOm9Y@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee4c0ee-657f-4f52-b5a5-08dd47ba66a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?StJmBctsUKhSL3G7RDBHhb6H8LrPjW6Hrhqjeas2gkqMXiX1zeB0TQkQBW?=
 =?iso-8859-1?Q?ES3e54AGSku/Gozyyu2S1Q/jJbWPwWGXUz5GmdmK0jMnAw3mEF106UtTxf?=
 =?iso-8859-1?Q?N/rMCp3SbxyBmzH3pv9cCmtzeVli3PeZ/0I6BImINgHGIP9hOd/oJSI8s4?=
 =?iso-8859-1?Q?pt0i2J73Kui7aX0EA0JZBXTSa35eWSOHA5D/BuRGFGRMfiUAo3jllGZgfc?=
 =?iso-8859-1?Q?XfydvTZ3iOJ5vcuZt6urxvQtax6VKH6TfzCpypaxBTAcoS4w0JVCwg831w?=
 =?iso-8859-1?Q?iNI5f7zPIcx+IqD9L6WQaH7145tvFwt2Y7weK/IkYTqmf+BPs6mEtEll8C?=
 =?iso-8859-1?Q?l/5WsDTrN9avmgKNopLjZdI3KavqaQB6QVeculpgIsvAa6Ugjf6lawxCLG?=
 =?iso-8859-1?Q?xGF2Rh9iNtUOg2NlLs9X28Rq8sBpsBtWzwFf7QeOEYuRtaqBElmJAExD+t?=
 =?iso-8859-1?Q?0qC6103eQVDoWAzsiCEDAs+jBYMYOT8UqpKdOdD+6aV3isjT+APnTNPOB6?=
 =?iso-8859-1?Q?c7XK8KLDdU4QZZkwRh1QxF7MQKNO25jub7k7X6pXIwIx0WJ6NqVltTPw9e?=
 =?iso-8859-1?Q?Ll0Coq0+wxjTp/ph9NMWIHNodbsnKpV4ZuOXYlLb2hC7FNpWBzfqgBAELv?=
 =?iso-8859-1?Q?Z8C7OwTnASqJXbaFhwdejV27FGLqh5g0FEkWaKEtkW2jf5a8k39r7yDIjy?=
 =?iso-8859-1?Q?W1i46tbRNCuW7yr5+v18IAfy4TzXbELoPAStAJbKvKp0Bjcn+wh/z6IMOE?=
 =?iso-8859-1?Q?OMzaSDpI6uY8DO+P+hcuFeWdv1hZZCqlPQcw6n73aBJHeorwFTVzX3YbOi?=
 =?iso-8859-1?Q?sv9KPS3z2IYNp9nP08W36QU7rcI13OWuTXHUcxpP3KblJV1ouKHCl2b+jb?=
 =?iso-8859-1?Q?+OfL/H0ArfwwoWNK4V3G9BdPVpF0e9tBDiVlwIua2rTa5CuEWOJki/bfmu?=
 =?iso-8859-1?Q?wv4+4Y9OoQv8c89zJKCKRTMiLs8nV+yReP50GeqFreQ2I+t1/iupmiSM60?=
 =?iso-8859-1?Q?cVHEkrK57ixvzL/TeG+8uwRGofg+NhFvTezsZ6ZZXFW0YI8cPDwubtw8d7?=
 =?iso-8859-1?Q?r9H0MU6sR1EvGBJtrmGd4prE3t9SqSxBzRMX8tmrrc73vtGDksDm4QEFAO?=
 =?iso-8859-1?Q?KBPWOImjoInAOQsJ8eeDtR18BReMhD5+Zs9fOP/zhF5QROobUV7wm3HUa9?=
 =?iso-8859-1?Q?ECI0RtvVkctz2QTXIh9yh5sGkqKCvDQpYhBgJxnDfGCmEeKFnRRAib7P7a?=
 =?iso-8859-1?Q?NnUvZN4g7xgG5sag8hFXFzlqeUrm/ZN8kDfGre35760GhcL6n2AUdiAfga?=
 =?iso-8859-1?Q?qIhAlpol2Wr3jWtMzskw8XX92N5OgfZwhIAJ/q2D5bTeV+q1yOrNgyDnSc?=
 =?iso-8859-1?Q?qkG5Ze7HT/RC8ynBAzIcGE9U+Nyc0tmK55hOmnRpvE8ohQSHGFrKCihv4V?=
 =?iso-8859-1?Q?v+TQUwjr2UiX4xBP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?gj/bpGM9Cy0SHA0EPcl4uCtzkRKi+czu8c7KiplG6qejACuzbUqYonVTVW?=
 =?iso-8859-1?Q?n7bKyyVi7YKG1qpFPXOfH4UxY2cbteCx0dgWT7HR7g8A8dg/jX2zg5LSsI?=
 =?iso-8859-1?Q?YCHS7n1551IdbGsVV/9rMEKmMzaNKFOzCPQiJSwMLoGG702QcS/r0Ffn0m?=
 =?iso-8859-1?Q?oYubK/af6FbWx3y8Ve4nfQCNgslw1OAQudoXtQFTpYhsKo27JnJZMu4Mjp?=
 =?iso-8859-1?Q?jEiLZOqwxxM0MlKV0S3NqO9t83ZEV1IEtpoDF6N/TahfFgJTQ4xRNoNzOH?=
 =?iso-8859-1?Q?juYlZC8cIzrhlx1EWIOlkcuXHn+Nb9zj2ZeZZauhwPdjssyOxQpcjMe9fd?=
 =?iso-8859-1?Q?4hzZ+raVw6P3SlxJPaDcuqhYxSefbcpSLJBaHHtOSW+wTXwxPrr3YYfIrt?=
 =?iso-8859-1?Q?vDd5Iu+4aT93U0VXO0JEZxqerRpDrxYGPzlIiaOvr1gHIv812tcSbsmQo3?=
 =?iso-8859-1?Q?b45DIipoHy7H5J4iQhE4KwmrNrYQ3bF6gA8ToMJBuXhO89oWRyrbGUoKly?=
 =?iso-8859-1?Q?wWgk4a0hpJ7nBChjd5SxCOQgvqavjvXOlL7rJkLzxp/BF0NK4qc/qtMENa?=
 =?iso-8859-1?Q?DXDSRQ8xeF8HdEGOE8Tl+ICic/I4erJx3/OROWje917QPtMJKGz272H0Lo?=
 =?iso-8859-1?Q?s/5ebuzG1XPYDExBBp5X/xSoN5cP+0LJKJAUUdZViqRuDq8tNecfwTfrwk?=
 =?iso-8859-1?Q?0wpHJuAt1+WkBwSyaJmeqmbZ4FUuG5SbhfjxMnFzRiErZ4Hr+o7o4BH5NC?=
 =?iso-8859-1?Q?NJQTt2AVNRQ4UsAceX6h2iDXJmpyEVjsnUREZpIGhGr51ljY5DboANfn7C?=
 =?iso-8859-1?Q?pTuvdxTgOYIa5m3XgAtNsRfBIFT+CXjybwls9se22rZxEP8be9uy9m4ZwZ?=
 =?iso-8859-1?Q?TBpDEjnGH+MPXWvALwecCOLJRws474HTLVSB0gTyVR+qYKYLq8Q32yQcQc?=
 =?iso-8859-1?Q?/uwKt+MYvep9FiZMHEnCU9Vz0ZogyZL4Sp8YNfHxEgHJaYpkJEDTBDZZvA?=
 =?iso-8859-1?Q?TtYgh+xPVNh6dSUvz7LJjrQSjbw1rAh1BVoXVOtDF1Wob06OLajvo04N/d?=
 =?iso-8859-1?Q?eKLrD4jwyNZkyTFWIbD/R8miRW8xJ+R2DOHvGfQQY9WuojQh61CRETsb9P?=
 =?iso-8859-1?Q?SLJhN3d6fQIOZP4K/i+p2ULU5+Wall612c0mEK2e3VPZARV3isDYsgJ/xa?=
 =?iso-8859-1?Q?MAg1mod6hsqWFp851cacUY3afO4S9dbFK6UgfFdjGNAaS7uCBBnSUKohJw?=
 =?iso-8859-1?Q?Mj6JZcbhTOM+Z+8ux3WcNzJyV5V5Hcn80se3dGzHYlwr+iDCXAP+LxymJ0?=
 =?iso-8859-1?Q?y6P2NcGLMkaPFexZSIGgZFB4sHyriuofBJhUUlyE0rbjqSgjwFxk/w8kem?=
 =?iso-8859-1?Q?d8ibO+Ssntr3ZAoTjCp63exL+sk2nmpRd/2mND9GWq9R0WbggKG5f5xLiJ?=
 =?iso-8859-1?Q?/sT8RC5Myo8JgWsLbHpyEP2cirk2g+4oN4Eov4aoKINFT/S00rLw+nuUYm?=
 =?iso-8859-1?Q?afjQSKXOztMkU4bz+rkKx+B0C9V+KUnIGDw6/pMBoYqV+M+IUFYxCahnrm?=
 =?iso-8859-1?Q?RWKVzAI+78QZjkuxRbbx/9yFlAljlrAhx9tWhWfaLlQ/QrpB2jurujN4KB?=
 =?iso-8859-1?Q?2EzDSY6CrNlCHo/Fmuyc+BNiRgYqADCymGb6DpRf9Ceq974j1D/zHyZA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IQEGtbHdVdIqbrjScUOuuEXbI8RQGyn0XQHJvJDKe0034Lp2Hq264b6CGKr3bgqoa68gtDSoUIPvS6IK/FeQaPjckWQ44jS9Va+7LWAsXxW5S+PS9m10WmusUya0qMUYkaJ58quVXhKCb8OjH7SFw5Yrfj9K/tcJkMuAq86HneH8qI+sa2ZA7SyrDezPZCwg+1B3guoQV0SBAkrd+j8Qv9g3jB8Uk7QHZvXoyT1/GrVS5neop43TseijQOF/0drFPrd4vDHA0siLoDe+eAi9BAr7L6vWDq8VV8cha0RPNEQIgaoebu0K7OHY7uVSL6KaR0jg8QFKYtLw1PHNWD8hUY115DkammYcn5H6Ane8HNEROslDx4r1pilR4vu9EihEYoMM0PAC61iKtaYwf+3foD0vcNdM4eHGa1K2et+B0HVOmgt4CF2Rql1MTXub8zolcIEQdYAjuYG9XI0upCJCqyj9fPyUGtWFlHOMtpboVcQdIJX/vp6LInaDwPfvsK4T0SVfRKquz9MEGV8kRc8zt1UG0GcteqU8i1FZfAzGKzanQTC3IUqMucyU0ITrLnPowg6tRzbx05OKdw0Gm8/NWS1pq93NhB1HUAkGMYAEBvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee4c0ee-657f-4f52-b5a5-08dd47ba66a3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 21:00:06.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVvHWk95poHZTTt9OLh9+epycJu0pmbCl1OwIH2SQyW6NadCdSBtReth9H9LSpAM4eaYYR6LPsg4LBGvcv0Feq/D4IZ4oBzrdTvIE5Ghq74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070157
X-Proofpoint-GUID: CNKHte6mrtvdbM5F0qv0swKEXFZppmAG
X-Proofpoint-ORIG-GUID: CNKHte6mrtvdbM5F0qv0swKEXFZppmAG

Actually, I am going to replace this patch with something totally different.
While it is essentially correct, it is just not worth it given that assignment
from string to char[] is not allowed in D, and somehow translators do it
anyway (in a roundabout way).  I prefer to just not cause this complication,
and instead will be changing the member types in psinfo and lwpsinfo to not
use char-arrays and instead use string (as is done in the io provider 
translated structs).  That avoids this complication in a much more natural
way.

I will also introduce a patch to change the ternary for string types to use
a string copy rather than using memcpy, because we really should be using the
string primitives (probe_read_kerneL_str instead of probe_read_kernel, or
even probe_read).  That should do the correct thing anyway, and when we are
using string types, we do not need to worry about training garbage because it
is ignored correctly in those cases.

The patch I sent to fix the consume code is still valid though because people
ca nstill use char arrays for other things.

On Fri, Feb 07, 2025 at 03:22:32PM -0500, Kris Van Hees wrote:
> On Fri, Feb 07, 2025 at 02:17:44PM -0500, Eugene Loh wrote:
> > Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> > 
> > That said:
> > 
> > *)  Is it possible to construct a test?
> 
> The execargs patch provides a test for this.  The situation here is quite
> unusual because we end up assigning a DTrace string to a char array, which
> is an operation that you generally cannot do in D.
> 
> > *)  Has there been an audit to ferret out other instances of this problem? 
> > Also, I'm confused what position we're taking here. We're saying that it's
> > possible for a string (which in D has strsize) to have garbage after the NUL
> > byte, but we'll deal with this situation only in the case that it's an
> > argument of a ternary operation?  Why do we not say instead that a strsize
> > string will not have garbage after the NUL byte, so that a strsize copy of a
> > string will be safe (regardless of whether it's a ternary op)?
> 
> I am not sure what you mean with 'taking a position'.  This is a fix for a
> real problem, that is unusual (see above) yet occurs and results in trace()
> output to be wrong.  It may be possible that there are other cases where a
> similar problem may occur, but well, none have popped up as far as I know
> (partly witnessed that this is the first time it is noticed AFAIK and that
> is the reason I am fixing it).
> 
> > *)  What position are we taking here on BPF register pressure? E.g., what if
> > dst were %r0 (okay, let's hope not) or even just %r1-%r5 (even just %r4 or
> > %r5)?  One position is that we don't do a robust job of BPF reg management
> > anyhow and someday we're going to have to clean that up and so being sloppy
> > now is okay or even necessary.  Another position is that we can add a little
> > code to improve things (even if other areas of dt_cg.c vary considerably in
> > quality).  E.g., one can fill-spill regs between the two function calls,
> > costing extra BPF instructions only if needed. (That's already a pretty
> > common practice in dt_cg.c.)  For extra robustness (beyond what we currently
> > do in dt_cg.c), one can move %r1=dst and %r3=src in whatever order makes
> > sense (more complicated and less likely to be useful).  Anyhow, fill-spill
> > regs between function calls is a pretty common practice in dt_cg.c and I
> > would think would make to do here.
> 
> I'll look closer at the register use here but I don't think there is a
> problem actually.  dt_cg_strcpy() is not meant to be a general use function
> at this point (perhaps some day it will be).  I can also move this into
> the dt_op_ternary() funnction, but I felt that mighht make it at bit too
> complex.
> 
> > On 2/7/25 01:11, Kris Van Hees wrote:
> > > The result of a string ternary was copied from either left or right
> > > value using a memcpy() of strsize, but that could result in garbage
> > > being included in the result beyond the terminating 0-byte of the
> > > string value.  If the result was e.g. assigned to a char-array
> > > translator member, that garbage could affect consumer output.
> > > 
> > > The ternary will now copy the string using dt_cg_strcpy() which ensures
> > > that any string < strsize will be padded with 0-bytes up to strsize.
> > > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   libdtrace/dt_cg.c | 68 ++++++++++++++++++++++++++++++++++++-----------
> > >   1 file changed, 52 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > > index a5c9aa09..b48e27f0 100644
> > > --- a/libdtrace/dt_cg.c
> > > +++ b/libdtrace/dt_cg.c
> > > @@ -1371,6 +1371,19 @@ dt_cg_fill_gap(dt_pcb_t *pcb, int gap)
> > >   		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, off, 0));
> > >   }
> > > +/*
> > > + * Store a pointer to the 'memory block of zeros' in reg.
> > > + */
> > > +static void
> > > +dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> > > +{
> > > +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > > +	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> > > +
> > > +	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> > > +	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> > > +}
> > > +
> > >   static void
> > >   dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
> > >   {
> > > @@ -1394,6 +1407,43 @@ dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
> > >   	dt_regset_free(drp, BPF_REG_0);
> > >   }
> > > +/*
> > > + * Copy a string from the pointer stored in the src register to the pointer
> > > + * stored in the dst register.  At most strsize characters will be copied, and
> > > + * if the source string is less than strsize characters, the remainder will be
> > > + * filled with 0s.
> > > + */
> > > +static void
> > > +dt_cg_strcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src)
> > > +{
> > > +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > > +	uint_t		lbl_ok = dt_irlist_label(dlp);
> > > +	size_t		size = dtp->dt_options[DTRACEOPT_STRSIZE];
> > > +
> > > +	if (dt_regset_xalloc_args(drp) == -1)
> > > +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> > > +
> > > +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> > > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> > > +	emit(dlp,  BPF_MOV_REG(BPF_REG_3, src));
> > > +	dt_regset_xalloc(drp, BPF_REG_0);
> > > +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel_str]));
> > > +
> > > +	emit(dlp,  BPF_BRANCH_IMM(BPF_JSGE, BPF_REG_0, 0, lbl_ok));
> > > +	dt_cg_probe_error(yypcb, DTRACEFLT_BADADDR, DT_ISREG, src);
> > > +
> > > +	emitl(dlp, lbl_ok,
> > > +		   BPF_NOP());
> > > +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> > > +	emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> > > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> > > +	emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
> > > +	dt_cg_zerosptr(BPF_REG_3, dlp, drp);
> > > +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> > > +	dt_regset_free(drp, BPF_REG_0);
> > > +	dt_regset_free_args(drp);
> > > +}
> > > +
> > >   static void
> > >   dt_cg_spill_store(int reg)
> > >   {
> > > @@ -3040,19 +3090,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> > >   	dt_regset_free(drp, treg);
> > >   }
> > > -/*
> > > - * Store a pointer to the 'memory block of zeros' in reg.
> > > - */
> > > -static void
> > > -dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> > > -{
> > > -	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> > > -	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> > > -
> > > -	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> > > -	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> > > -}
> > > -
> > >   /*
> > >    * Generate code to promote signed scalars (size < 64 bits) to native register
> > >    * size (64 bits).
> > > @@ -4603,7 +4640,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> > >   	 * dn_right).
> > >   	 */
> > >   	if (dt_node_is_string(dnp)) {
> > > -		uint_t lbl_null = dt_irlist_label(dlp);
> > > +		uint_t	lbl_null = dt_irlist_label(dlp);
> > >   		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_null));
> > > @@ -4619,8 +4656,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> > >   		dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
> > >   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, dnp->dn_tstring->dn_value));
> > > -		dt_cg_memcpy(dlp, drp, dnp->dn_reg, BPF_REG_0,
> > > -			     yypcb->pcb_hdl->dt_options[DTRACEOPT_STRSIZE]);
> > > +		dt_cg_strcpy(dlp, drp, dnp->dn_reg, BPF_REG_0);
> > >   		emitl(dlp, lbl_null,
> > >   			   BPF_NOP());
