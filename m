Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87710A3E
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703844; cv=fail; b=FHePVOszp3fC0AZ6bparJDbaDHW2+thbHeUqRxacm6zwP2n4NV6JpFhUf8v4MENdltr+mNz5lKoayKEnDmgROq2kgHJAu9qW5d5mIw9bAwQT5h3GwLKrtlp0MKYkPMUBLF79TlrT4QDUuAzDB4IuqKAm26iJVaDkkuIYtiHysPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703844; c=relaxed/simple;
	bh=vRtJltBSfp+PPH9u6ZOQmgfUC8HKnD/rmG983582A+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pKZhwuHv5r8P2Xeuf7YsToUdXNX60iaRHtW0xxvDxeRSVn44uxOWHP6s2JB1ZSpDFlyNp+q0kmMr+HEp5X72E2mSlQpoOEjM7Mijg7dPQYfWQD1yHuaUirKQop3+G2VqPPAEwKB2ekwJNdXAzfmLZhHIr9k8yBTLLdPr03IWPBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gLwyVf5d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TkYHWqWD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gLwyVf5d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TkYHWqWD"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3NbNl026358;
	Sat, 12 Oct 2024 03:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=EfgjI1FNnBG+zWjRIN
	Bj0lDrw4fOw05XPaSOwD3q6+8=; b=gLwyVf5d3Y6SHRILVmQyXZ0HPpwZkA4zc9
	Lo6wUbjdJtPlliRsF2TS0FONjWf5qqTnm9MMXjZ6vv0OsUtvDh2qYID2uGXm0Gzy
	x8QSvIMikh6f8UFJKjUxe7ab1PrjSggziTE75zUhQu3NdNa3ZsQ7V+GzKxYhl+9D
	s2LYTxhvDrQCTYwPeXWQIiwE3Z/crwvsTUYTzlmYNSTvOMwdQLeclLv1VD+wmGiK
	bUzrRUG+tPBnm1tsNtK13ty+3iuO8mPuUKbROn3idkhDzRhshZE3iG7MCXdgpVv6
	pNyl3uXiUA1TModEwL15kVnqvuNWM3RNmHDU3Xu8DAHS0AFmSbCw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5c804n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XCks019917;
	Sat, 12 Oct 2024 03:30:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj49mkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPLn5lwsXljnhpJlK6eZvi6x/DceUnr57+sx+5KxhsR0nUyXGMbt0DyxzOCxgd/OqtLtV/tLkWYpqG6g2pVglHBwCL8qTaOryuiXHvA5gjKl0g8p+bNfXrioaya+bWfzuJ6+R+zBROjQKnETXWz2ptr0DwBu2cE0a+8TAB4Skz0m8YF4yoAnywtbbT1lBeTCxrx+ityNbVuno4tA8j8FxZkfngUrumfDyeJNhfyZ7jpV0WKkzq4Ari7vJbku14cOvuNon71XYcLZgwYuFWP/eimczsD47sY2POuo24XSokaD2FSjr5qr6hY70L+NsTGC3dVKhPoRtjWaVGZngjilpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgjI1FNnBG+zWjRINBj0lDrw4fOw05XPaSOwD3q6+8=;
 b=EA5fe+TNcmEj7/mhe3MP+re0ShRMESJSjyshfAqomDnJ+DQTFEtel5NEdIoD6gY/yEk1q1oxSkZOuVMUGlOwlmJsCKoIDgrlIlWg4rnymP6yDgihRaFGJYwN9CAKg50FKhImeKtkN2jhornfUhf/JkgoByOFCxuI/MF1XlGr31Sbl7ZW7GrTHOsbhfGfis06RXPmFG0U53w7d6d61LOOzpBaFUOba82sDR1yeJMoTZz+Q6gUqzqH2v73pxQm/kco77R3DxlpJ5NPumbKkjTWuNiB9/uDiEiAaZA5NO04+PZ55m24UOruZuft89K5m8DtXsawfDgckoRG4XNaSDnm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgjI1FNnBG+zWjRINBj0lDrw4fOw05XPaSOwD3q6+8=;
 b=TkYHWqWDokzPQBzg5uQCTVoaYHSVCO3ybLwAwb/aZVg0i0oU68n6w3tkFz0I3xLpGE8CPpkkyMjLw3M3M9pDqof6zWv5oR2m+KJRCm9CpoAAQP39nkq7AQrPBo9nHGBfZFv27JBNlQBdIx4/JSNvef47O1U9tilXXv1GHU3yecQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:30:37 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:30:37 +0000
Date: Fri, 11 Oct 2024 23:30:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 4/6] test: fix 'CPU' typo
Message-ID: <ZwntW53NUDugfTQ7@oracle.com>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
 <86c371866cc52c58d8ab5d838a23974b3c23ba2c.1724962546.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86c371866cc52c58d8ab5d838a23974b3c23ba2c.1724962546.git.sam@gentoo.org>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4f96b3-b3db-4532-3dae-08dcea6e3d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?39x5ROr7qreYToNGegW0XAB6EimTKC6G0wdtcBg3884+F548yPrElXY6H4tb?=
 =?us-ascii?Q?mXuSGi1p23xOub8CjgDTT3Qb2jmR6l2K/6mH2cbi21loHQVfHw9vplaQyZON?=
 =?us-ascii?Q?SU0yGsnehy9vUALd9oXmnTTZYFmHJdZA7SjKpZnOR6YoEtnN4RUcmzDiGDxw?=
 =?us-ascii?Q?W+Hx973UQ5GBbDUuIHtLT98fTExIQkKGllUsDeuMe5Am4m9GRRogBl03LlS+?=
 =?us-ascii?Q?aLh2sO77E8BB9NBrWlY0e5dZXRtwSR1k/uUDD/Jg+Ode/SH9jYAUXjntRLM7?=
 =?us-ascii?Q?vd1uw9r5Phn1f4pdu+ljQ+xd0EgJpm4bY/05TVXr3v/ry/iCZQqyhtid1rRw?=
 =?us-ascii?Q?b81tyZvuGxBOIU/kln8LmXL3QVY5XsBZMWqKkSlyJwATbLWViZ0JLvhU8Mpm?=
 =?us-ascii?Q?armonaNLFJ59XrQB5YL8WetFELYKhF0GxQQuutggtrXXRIzCLgYrE3TCinXn?=
 =?us-ascii?Q?gtRAhvABLccpQk7A4Cd7Ev2UVcGote5Zvqbqg9ycoCZhAkoR8JzxyVcN1pO7?=
 =?us-ascii?Q?u/Ka/dFY1Q/8POFOV/xrn2xLQENTS5XMLLMnvFlZ46Jng/cvQcyzhI9AHAGM?=
 =?us-ascii?Q?sVNF+V7CGcbSKBJ2jsCEjkkWMRz1Hr60mPLLFS7tXhOYcW4lc9z+f0QlitdG?=
 =?us-ascii?Q?bCIuZ/MbnKgyPBYqZ9wGCD3N0s5Wz3OijVkqe3neDa2hngCkN297AwWa01Tz?=
 =?us-ascii?Q?XfeD7v2qMESR8sNSlnEqA0oKjreEQeojbx8Z1zFKLSZ/9FayV+7dLxrkWzvB?=
 =?us-ascii?Q?qMpeuo5d5nL4+I0JFmq1ByGHE/E+rHdyYbcNe0Jt6crmqXM8YOlaXqi131zj?=
 =?us-ascii?Q?2DafFeit7dBLDzfom8lGwmxrz05h2mXF26PLiUE8xw20543v/HtPVEPcBZHw?=
 =?us-ascii?Q?DPPcbzvVvojaLcdkNgSbB4W6n3HXI8a/ZAuqElrSvXHwKr/vqZGxVEkQ54ra?=
 =?us-ascii?Q?Rcea3axIyOCbclhOtYU0Iui6dFHTvxZynp1QJe6VIK+f+2dWyYSztnkXyWSE?=
 =?us-ascii?Q?5IEgD9xMrh4RObPxAGZGsG+mojo/7TVJ2LeTe+RR2qhIxCy94yp5gD5CNX/B?=
 =?us-ascii?Q?epCkUC8nsRGRGhgDxS+nREe1AcdSJaldt0KXxqFbC9ydgn599m0PhmIdRr/p?=
 =?us-ascii?Q?qyze24vijMXk9jYpVE8PeXR432cp/xBzLMut8GhPq+fe5hDd5UBw8x1Rmlu4?=
 =?us-ascii?Q?WShzQ2bmUYq47sTnOb+mKkVNUGDiBzTMLZXPW51sj2top1zxGCAAANyUKltP?=
 =?us-ascii?Q?evnXuuEccqH7Bhbl8APi90uI1xj/zPGPxK/dqDrHWg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z6XtfjRVQdOE01R769tU0DxrgJmYk79CwVn2DE074B/CkHzffEdpcrSj1eXw?=
 =?us-ascii?Q?xyAYtBB8nEfI1/2dE25WcJyHCo4m5EDvNX7qVNVR08AvbavOBNnWst6WvTvo?=
 =?us-ascii?Q?JQ80PprS0FkGq0Nv6bamghtRjkcDNPQVYOGt80MbNu3bgpRtOD6gKiRqW5nh?=
 =?us-ascii?Q?uvUdYARv10s1A9VWui/ZDOiU4qMSm898ka5vjQYO/xtD2uSahk2wdVayDEPX?=
 =?us-ascii?Q?A1tehpGwwdkwGd021SKM02GiuT7aQzuKRbMgbyDbO/wg1b7P1XiO08XYDJDy?=
 =?us-ascii?Q?WC7lLo+dQWBc38HEBt1giDFKH/zf/Ur7eMuNqu3T+DfTv8mfBhCnOEoun1hZ?=
 =?us-ascii?Q?vuZPxqI9f5PvlnlAd97lXfBrsbfbWvWdL0kyFMDrS//XKz4kJL1Eu5Lht5EW?=
 =?us-ascii?Q?as9GbOoppKjIiBmTGTkKawTKjuQM+03kpE0H9aFqCWtC9QhEKIh5Bvu2Dqze?=
 =?us-ascii?Q?zTiqJlWcKXoMAMAcvXoDtlzZ5uQVKgwiSLxBo4pqkSbZ8bcF63FEeNfkWveZ?=
 =?us-ascii?Q?LVYxcssvaNyLtW2DH6D1v+oCoYMGngf8wST4yVoAx48s+iYT0WsANyW4Vtxd?=
 =?us-ascii?Q?YYnW9Bquow8U5hM6VMCLVM0+Uws4cWNMc6DB5Uek3kuGbUmy/XItCmbhGjn1?=
 =?us-ascii?Q?EUZgRFAOaGZ8o/hIcJgeQ0JZ4AUljrnWTf0o0WuoUwERSnUzVtYvG23duzs9?=
 =?us-ascii?Q?HRSNcxQemzaQKNxmgHHBWYNmag+D54ZHFGF9ShOFSmfIPf1NOalaflfrfeE5?=
 =?us-ascii?Q?vxefbAhMj8XUYGvl7G5wUz4ioEcIwDiD3wV9MdGo1TwhieFavqg68vzUrGRP?=
 =?us-ascii?Q?bbNh27Boz+P8LXy2CsERBVkKVqXvWbMn++9mdkbIRjuDAlEuFM+9XqroSLpS?=
 =?us-ascii?Q?Ru6R+3nKcGK7D+EWwHC/ovqr2Zv8fv+LKQ4DzKdltJ0+oQdRK++57KOM44KA?=
 =?us-ascii?Q?YcDP4rnTnHyJO0CB+UROdRzmi+Wpo1H2ZnYp8XGtl7ebH+YaXMYUbx3w3b2d?=
 =?us-ascii?Q?cxVtk0i2w1jDEZrbUFvnQdyPeF6tW3iIZms6FhIVmHYcMZQ0GHcUssXTWtlk?=
 =?us-ascii?Q?RQ0z1s6x5Syrbn+c/LEDnk18MhRX53AmgEDvjT9ACY9O4R65t03jnnVG4tjW?=
 =?us-ascii?Q?nEoLJlhTx9YIZJNKI0K44TQo3idbTtkgNkzB5SfhkBg4Jxr8Jk5TeCRQqQJl?=
 =?us-ascii?Q?l8aeQ3xrVz5Wv+O+C7Z6YkpTE950uBCC7e18wIiwrfzknFsLDGVdJpCu51f5?=
 =?us-ascii?Q?UvB2MpwvNGRQow4Fc54ygKnhavf/gE3zg11RKSWXZqijuLUdMxT+oYRrAQVW?=
 =?us-ascii?Q?4q15Pz8hNj1NhQE5E8nQp+xpwF/8rNbW6V63Zo5G+NoTa3ZfkvdqVoY1d0KO?=
 =?us-ascii?Q?NLZ07fZONvpLnF3Ac361WwnN/IkBxOrxbsVbfuWE2TeQO3diVoE5ML2PnqE3?=
 =?us-ascii?Q?SgLsy0ojuY+JnsIf4BWCUJWspt69Q+HaUP1iJYe8X21jFEDi15zJYxnjTav8?=
 =?us-ascii?Q?MhgS+c+/rTzH/YpCmV2ptG27JRbVypIdNZXxcsmpxNyjsSWqJM/jYojh4KTw?=
 =?us-ascii?Q?6PnMY8iMIy5Bhaatwnz7R5vi+tURiaURUaWlZL8EAmvfEsn2tsaFaba5OSJ4?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OAWd1ZcuKb3T0fB8ADXpEVUsqNAf8h3I/fijELpGSft2Q9UGHHEk/WXiVdKeyF9e/Pl42NN0081LZLTZrIgGHa/fiqWeEXfPziRMEhHGz8XnoSpRxpPOmT1UC5ttqrc5/I8EXTIoodFFmsw+wpJGY1p4XEdLzBtKrBAs2i9vAfOVyg9L0MxrwiShlzwauMZqsvnTrPMbxkhk1X2iInJj9/YsDItKuba9/3SptCwrzYGnMh9XNGjL6h4T75bWWusc4wCxFzBxGoJAYlA5PGsRWCc4LE0BGMQM8u67pkeJzid+2naMcTdoiaqSOsFuq3nMhyvTuhWE8MP0aOJKVnClLS7bYADOE4pkJtD/WxYRCNDR+SNViIfSDjmqDZwE59StMDOEPgMp/Pu316G9toorkheHOX/cjxfKJR0EgU1I38+kqlg0LWjcfuiSP7BFgxt6tcevOx4TmPwtvyfXV/pfK7habB9bEQnPpwp7j4+7YyZpAoXWPMxF15xjfcOS5ft07e939iSEKk5H4HmrpushKSqLTo6tJTh3VXC28sRd5IO0NDbUM7nfwKSjBSoOes+ivr9pHOSD56F6zQcyyqj/QPGyTyyFHicalgf5+JuwGHk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4f96b3-b3db-4532-3dae-08dcea6e3d4c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:30:37.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdd2H1Bf6uNdzhNerZ78qCvkMFMGAU6gudmTbJXDqS9qnsXhuHfaeHXsbyohv/pzpxyUkvdBANKKAihpThcpsqzAxUo8pa8bZfMMt+G/+lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120023
X-Proofpoint-ORIG-GUID: 1YoxCmMYhnoVzzyGU5gVnEg2QEUtP-q7
X-Proofpoint-GUID: 1YoxCmMYhnoVzzyGU5gVnEg2QEUtP-q7

On Thu, Aug 29, 2024 at 09:15:44PM +0100, Sam James wrote:

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p   | 2 +-
>  test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p | 2 +-
>  test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p     | 2 +-
>  test/unittest/drops/test.drop-cpu-ids.r.p            | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p b/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
> index 5c91fc50..e028c2dc 100755
> --- a/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
> +++ b/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
> @@ -1,3 +1,3 @@
>  #!/bin/sed -f
> -# Rewrite reports that have a variable CPI ID in them to make them generic.
> +# Rewrite reports that have a variable CPU ID in them to make them generic.
>  s/CPU [0-9][0-9]*/CPU #/g
> diff --git a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
> index 5c91fc50..e028c2dc 100755
> --- a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
> +++ b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
> @@ -1,3 +1,3 @@
>  #!/bin/sed -f
> -# Rewrite reports that have a variable CPI ID in them to make them generic.
> +# Rewrite reports that have a variable CPU ID in them to make them generic.
>  s/CPU [0-9][0-9]*/CPU #/g
> diff --git a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
> index 5c91fc50..e028c2dc 100755
> --- a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
> +++ b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
> @@ -1,3 +1,3 @@
>  #!/bin/sed -f
> -# Rewrite reports that have a variable CPI ID in them to make them generic.
> +# Rewrite reports that have a variable CPU ID in them to make them generic.
>  s/CPU [0-9][0-9]*/CPU #/g
> diff --git a/test/unittest/drops/test.drop-cpu-ids.r.p b/test/unittest/drops/test.drop-cpu-ids.r.p
> index 5c91fc50..e028c2dc 100755
> --- a/test/unittest/drops/test.drop-cpu-ids.r.p
> +++ b/test/unittest/drops/test.drop-cpu-ids.r.p
> @@ -1,3 +1,3 @@
>  #!/bin/sed -f
> -# Rewrite reports that have a variable CPI ID in them to make them generic.
> +# Rewrite reports that have a variable CPU ID in them to make them generic.
>  s/CPU [0-9][0-9]*/CPU #/g
> -- 
> 2.46.0
> 
