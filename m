Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197884055
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717526709; cv=fail; b=NOpob7soMKqSNVs2Hgwbhezd5bChHB9fKeOY2hMWKPPh98nfDlIiUGGIuW0BOhLeohSQh5mkclhRGhuW8Dkcr0WCNUZZA/Jrav80u1dbWeg9Vu6lSQpJc7EIt1Cpx8BJU5j5/T10h/hA3s+oPP1A4YERQqL6V9pg901AsfEIS0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717526709; c=relaxed/simple;
	bh=5CvNrUKwwaEgDYMr7RsmDh+Yud6m7b2iYVRqQzinPHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kfquFOwzWY0cwJFzii+Uni4VnEinJ4xIPTLbSRYPKJpoMqbLRAfZHsjJxqnALGeP1fqQa5G6FOucZOeEoSOzLZuCpm10/pY4I3Asn6PsEhETUrUUmkyX3E5QxZ8o1SSogu4GrWPLGfZA3XmvfI/YoM8tO/qtMqxE117zQuoZKMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnArF000704
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:45:06 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3DD70tv/sOEM9/?=
 =?UTF-8?Q?zfqxa57ov9JEWS8w103XExwcSBSiSTY=3D;_b=3Dmtl0FyNs304zBMhbUhHkxgZ?=
 =?UTF-8?Q?+x0Twma+c2DPIzW9uXsSu1GOszofhU3HKvQc7HT2U9Zjx_zcmcAwcRdhDaM060G?=
 =?UTF-8?Q?Bhm/KeHoCarDAV6rQwLVhMvB5yyZKazNrzla1JT+dVEA8TLksNY_8wQUXDySGUI?=
 =?UTF-8?Q?IYcGK+j9gcb0k+fKKLzmSetF7Ynf4XOBvSYt1OL01LuUdNNa3UEODo0rx_/xUwB?=
 =?UTF-8?Q?w/4kCxSkeliH94t2kvaRkI6U9EDz/GjnrCtlHJ1HDxSEbPH3ZRf6/xKoczL1JiA?=
 =?UTF-8?Q?_nTmgKeVi2RCvixzixeXEDNWe4ozw9VqnvDxl1dXDYhgfCtIh50uLskvhu+ngqr?=
 =?UTF-8?Q?Xw/frS_hA=3D=3D_?=
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuyu5ns8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:45:06 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HXKQ7023932
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:45:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrqx8dx2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMBA6raWV8Ng5bbF6Y5qZyDPEo3qZBadToR2PKnNdiEetDJYMEeoHgYIOTHT4U0R/AuOOoRlHdpcyYz4fReFUOCg127534R0BEHEOo/0Fvr8ctTvsd5IzDbUeIwVY0jC9uTJv6FbvZrvKFvCTtSPZ33gQitMtqmuS5qud0cmFZYt/0WUCLg+WVUatV3RASjmKYVQvRdEY+GsGlAmmuPCLtvAml+OvTcKIvf70Y4yuAPYO0vwTajITRKmQvGKXwQOZFFQjr9jgVEan6ewNUGTsxpcSsTNV5ZZDMUuKE2ot4+cfqvXw3O1fBfPq/MPJNsYiWFjz8CZVspHpb7v9/S/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D70tv/sOEM9/zfqxa57ov9JEWS8w103XExwcSBSiSTY=;
 b=mrC73WaHfq/lY+8Pvsa5QNYeeRKH77AmU0NREoHWOD1PSV9hfaXh0QQp+lx4/oTnJ4egQi5EvrR8qjuN23OQgqxyPTCrWagNCs5FbeUaeJJQGdzuNdxT5EKBmnEvXKxFYao0Cjt5g1Xjr0JRr3qeXZPjzL6lkTQFYCA08VBOkXqPO//TfPZOKxEOBq2mBHEWSm+SLz0E5SEtbsbai0zqIdo9FvVf8vvXdvFLqm7ma3dyqIv6CJgel9+83klwqaUZ9wECq8MrfA89rSpky6ELgdMCWpWcjP6kUodMjYbdFCh/KpxdaCPYh7cc3Dt0AoBYzMWvR093h0qaUT+A0jOYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D70tv/sOEM9/zfqxa57ov9JEWS8w103XExwcSBSiSTY=;
 b=Y/55yqhMpVJBzYLtAJ5pHPGWYiMROXN1GSeSJ5s1WbtlcpudEIvpSC62AByNZR4TL9xQwowlM6S1+P936hlG4DEn+DRcpsGenwDrGhfDbrnUrN4AZVDLv23LEVlvVBkanWn3iUG9mvmdE3XKeUgXmaI3a3mtsM0P8QOI2Kc8P8w=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7817.namprd10.prod.outlook.com (2603:10b6:408:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 4 Jun
 2024 18:45:03 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:45:03 +0000
Date: Tue, 4 Jun 2024 14:44:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 02/14] Clean up prp/uprp variable names
Message-ID: <Zl9gqz2tK+BdRRSf@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: e52615b6-1af2-4b3f-6410-08dc84c671de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eHe4SdE9fkdlTX5Dkesb+36eAppn/T/4qrHMoPzuDE6IT9oMh55f5KFc++qn?=
 =?us-ascii?Q?2e4NZZ7LBaffr7XoNeRw65SFrvlRMhM7RjLOiRgpAY87n/E9ab+/VULSCLcv?=
 =?us-ascii?Q?3RWQPMRp/sFw45QYUjsBd91Yn5rJWKwin664cGWDcxZ/qTD9vpYdhkiiquOc?=
 =?us-ascii?Q?S5S561U/fsQXlqzQxBGXJSfSCCum0rAqejTmJj6ql2Eg2oe8wXuvUpTmlPw0?=
 =?us-ascii?Q?tRJOIUvVtOIjB1xG4IiJeTfaYQWNXEGY/P1JHFdxQPVYszFka9HUbkvVjsOh?=
 =?us-ascii?Q?JeEZ0PBqIJLeoFPrKD1R0PE1rt6ecnxlKFQcOF7ygFeiEGo5TqxkhJBqSQtp?=
 =?us-ascii?Q?lls7aoD1KxqFquCDUCJe/xGR7ieuu/CkhqgsC44Q4Rg9KKUuaw1GEOAoSMUI?=
 =?us-ascii?Q?dNhWzO0uREkPfURFIRtlw/RMqzqsbNi34e1w+uZLNINGkrpJHeStSqud94Ta?=
 =?us-ascii?Q?Cf86J5+iOjQEdWM+4fghA++8159ton4cOI0xsZKFenfv4UyleDMvrTJTEaDD?=
 =?us-ascii?Q?B4V8iXLnIwEmxBiis+HOGr1ugbJSrx/MjiVoy8rOdHRNAXZTW1R4leXOoKE1?=
 =?us-ascii?Q?ks3J6za3Pq4lKYMOMSQRwBAy4veR3pfwxNbmSdicWfLTjGg2vU4dagnGPO6y?=
 =?us-ascii?Q?iAr0c767GPzSxtB4wPNdcg8Joxn1CO9qYceKweJbZD/PMmYEuFME8KUCvAht?=
 =?us-ascii?Q?zFByY4jQUSwhhjLQxjedjhPvIA8PF3DdKvtprV1j3A6msB+nw/EMU/Rpocva?=
 =?us-ascii?Q?glvXmz45jhqcZ/e1PoyZyui/+s38ra/8mMSg6QhC8XjAgxD2nY6rIsj4jm1u?=
 =?us-ascii?Q?O02/cPNjvX0TKH4rPcdZ8x6xG0wbeUMcYjUCH9CnSi0ClWxZgZJrHkbX5Spg?=
 =?us-ascii?Q?/Tgh7i3gNkN/jji2WLf/jzpA0lku4+zZtgv/jjoO+gtlHVUOc3hFwZ+oLN9L?=
 =?us-ascii?Q?yd+C70Feo339dIwrlodFP9HfekgDOdD00eTqqttBx4rrA3uvQE4GrPvEQtx5?=
 =?us-ascii?Q?PX7druMB+a5L/8BZfaN03o+JeowMDjp5/Zp+pyYwAkYioOOSJt1RCtDmcXA1?=
 =?us-ascii?Q?A5BrlWKfGdoWriV+dHAA0dOWGzicExN2T/QPR1BOwLXUNa+Ai94yEVLi9QDg?=
 =?us-ascii?Q?YdrvapS0yuZs3b0VO8YHgtl6b2gMjmzh8OWtvgSec27pUzBDNTqsorfvQW3s?=
 =?us-ascii?Q?NXmHjus0Ra8wSfQyq/N4xJWdxwyLb/VLOT5pGtQWpwggR7188UinlZoJFVYG?=
 =?us-ascii?Q?FH8QyV3bgjAsq59DCIwhpLS0Z4Uk/154sAzoCEUOAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BlkAwON0O0uog/XBMuYsnzOJBjLi7OlD9Vs5+ykL44S5L9y4WIILk3NlILal?=
 =?us-ascii?Q?xQCJnN8ge3QpZ6SmD7CS+pAmi1H1NcLN5NZ3O5EGl8kprCCAcHcyjfRFX/Rq?=
 =?us-ascii?Q?j9Tyhv/EB1uKCTzU+Ypt7JxhYBkKLBq1NWb/77i1CA0+ihrkOpt0iM6RXlds?=
 =?us-ascii?Q?C3vD3hgPT2qp6KXCXMKmYCAxf6yqWyk+U1cPhrO086Xuvcx5PoA3xM2NDToD?=
 =?us-ascii?Q?/JKjVFILjpMh6XNUh65roWBB/0QWqg5SV0HYg983oVxp13WcMn/MXLkD+B1E?=
 =?us-ascii?Q?KL2towxiwqHdEjTgYcBTA9xhmq4OZ0IOjykdgrkxSZSTpdmmmrlLf+Vp21S5?=
 =?us-ascii?Q?TOapGPnWyk7geut6LsQKFP0cZZ6R3M/V+I9103x4uZ+3Jklg3GHKbM7oXZ5W?=
 =?us-ascii?Q?kuPNZaR8hppwrdPcDSw1eO4eipRKkEYl2CBb9ul+5r/VEaeH0RQ9pH2z9xze?=
 =?us-ascii?Q?scjmUynQ38D6gHUgks0sMhnFDZcJCTtwLnmEOL5BBa1jftgZF72+sWmwO/cY?=
 =?us-ascii?Q?nID52/ZzolzPDsVFeEG7YClI99VdRaCg+K8fe2C1R4el8NLPOJqZoBoyjMD1?=
 =?us-ascii?Q?i5rZsArXLMGKnWAnYndikl7IbmHvzLpVGPoEj2GL6P8qpkeKjfr+Pen6nEHm?=
 =?us-ascii?Q?K98LYy3V66uwZPKxGWP8187hjV0Oa2Yu2vrEnI6ddQJuowEiYHTGDubsSOOa?=
 =?us-ascii?Q?+fVxetqj5cmxsavbC0WgJT0HhIFdg0fn4BZP655k1t2Nju8tBoJaZmxgv0MN?=
 =?us-ascii?Q?O0a+tRwYtkoJ76lTCzot9OufwWlwvH2cOPnWQqD7dKRm0P1QCmuzt06PEMzE?=
 =?us-ascii?Q?W/O6chCvQfpASzp/L0NtAjjrXQHeTBdFV7/R/7NggrDSl1syjtlCk2EFygX0?=
 =?us-ascii?Q?E5+9jjOjh4OhOoSiYE2YCOvNhdzrC4b3DrC2slWXbFF0xLdxYkI29+JkNvG9?=
 =?us-ascii?Q?lEVvTbxcvbXZ1hi+EN9MRSOOl3MLwAPKqdg0FGIDvk5PqFxIhi67WGjtBZAt?=
 =?us-ascii?Q?L/CPvENzgtGOso8m1nJWaGr8HDH1fMz/koo8g1wer+VM2tOY8GMSku1WLu7V?=
 =?us-ascii?Q?5MiKkIuSMatBfFPJspcdYWhdwyUvvbY5HhwlC5p8hRzAwVCCGsfipIKj0B3v?=
 =?us-ascii?Q?Ja/fYyIfm9RVvWZb5RZiH58yaYi0T6ENGElgcfkUe3S2EYaCDAcxdxh5MTTx?=
 =?us-ascii?Q?D8C2KfziwJNprkNCoho6TJtM/UWJJ/eP/VgcbWJyjX0NlhaQKlEjx//BOmpY?=
 =?us-ascii?Q?YbuvLAqTVcXBOIcpGZd8X1syeFq3Xat9dsQIyMdoZoNqhxbtuLVQ+XZ1+ihw?=
 =?us-ascii?Q?5uAKE0EUNX00b3L3b/IQI9H/RGyAMuzyKANcFpM8bDzKEFLnHFN2W1ZZ+lOF?=
 =?us-ascii?Q?2Bo2879KtULq1oawXw8ZIf/n6vKfprLirO4z2onFtk48LRhFjeKY3jM/pFpT?=
 =?us-ascii?Q?/1EgEuXpF4E/A6p0zuSfJL+OHborbYBZrs/f82sbbBQynbfOGOGoDaT49EI0?=
 =?us-ascii?Q?TZ5rZTbJykZjNvywDtsLDho/VcZbc4B1VDH5hKSm2uuWmArs2vG9vd75NIN4?=
 =?us-ascii?Q?FhWnaMSDfQ1Yf/m8uKFLaZ+sV4NjZUZObYHVC3z29PDR28rJavqY6E97z5gX?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M0LWnWPrxKVKWX+gXP2IZOp2aPANppYB+Qk4TPUUSM0B4VdWNa5Cuk89pqvoyTIIrorFq8+vx5lxifoTJMW5L9xZjLoO4ySpCzgKFV3qKT2rzZ+DIjGF1X+/GsrUQCz6H+pUwgigU2E9mBZQEWtnmoH+hpHYta8gMf6ny/VzrkoFN895jGvXuO6954rSbrY8aMaPV2Tr8OaJf6tM1lUa2iJ2mweR2M5xOycEffM0XgSPUWGxh1STWvUGjAFw5CFA79bKLzrGSiBm9zculTd2y4gjybHGuB1fYQb8jU2jNfOWFfE94RWdEhgOn3ClOspVNyfw95ipsudNqfuteuWwxXKTo62ZAmh06fsPLL3IzCvhc7RbPzl4MbBMSXSHjRT5vGR9Kn2XK/CvV74Nh70J+f/ew9iQfLd2NE5sU1qi+CUSsJ1nV7HUpBohh15oN9yHR/opIq35Q+yIwsBiMqPgyErQzYQ6P/XbSjIIG+9kX91RLpqBOrg165rqqSX1Hg6FAQ2JkRgsJOgWQwx9D3GDOiHW3N/eUS5XFxYOn9sWOWCsdB1bTxtE1/kHUs0bVHXO1oOPokSKZf5hh8sk7mko1AUDYZz1hrBuoI6YNzrScK8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52615b6-1af2-4b3f-6410-08dc84c671de
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:45:03.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKK0wh2tgn3Ein1kkTX8rxy/1qqJ78YULZWbBRtfZzFqpjDB/4LkRlAZA7OyHtM0UX53q3SlUDnPGQcZtLfZjOs0nhSI6TdK9rhXx1v/OI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040151
X-Proofpoint-GUID: CFyz8Vvvh_Hdy9cUblVHd9_Gxx8ujhxb
X-Proofpoint-ORIG-GUID: CFyz8Vvvh_Hdy9cUblVHd9_Gxx8ujhxb

On Tue, Jun 04, 2024 at 02:11:01PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Should prp be oprp?  Or should we use opr and upr?

This does not belong in the commit message.  But yes, we should stick with
prp for the overlying probe, which is consistent with the rest of the code
base.

Also, I think this patch should address a few other issues in this file, e.g.
making sure comments are consistent with the code (e.g. if it mentions we are
creating overlying and underlying probe lists, the code should also create
tgem in that order - or the comment ought to be updated to match the code
order).  etc...

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 55 +++++++++++++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index afc1f628..cace406d 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -6,6 +6,31 @@
>   *
>   * The uprobe-based provider for DTrace (implementing pid and USDT providers).
>   */
> +/*
> + * This file uses both overlying probes (specified by the user) as well as
> + * underlying probes (the uprobes recognized by the kernel).  To minimize
> + * confusion, this file should use consistent variable names:
> + *
> + *     dt_probe_t	*prp;   //  overlying probe
> + *     dt_probe_t	*uprp;  // underlying probe
> + *
> + *             Either one might be returned by dt_probe_lookup() or
> + *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
> + *             Further, uprp might be returned by create_underlying().
> + *
> + *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
> + *
> + *     list_probe_t	*pop;   //  overlying probe list
> + *     list_probe_t	*pup;   // underlying probe list
> + *
> + * The provider-specific prv_data has these meanings:
> + *
> + *     prp->prv_data            // dt_list_t of associated underlying probes
> + *
> + *     uprp->prv_data           // upp (the associated uprobe)
> + *
> + * Finally, note that upp->probes is a dt_list_t of overlying probes.
> + */

This comment block is too verbose and I don't think it is really needed, if you
are going to rename variables anyway to be consistent based on your proposal
(as you do in this patch).  So, the comment becomes unnecessary by the patch
itself.

Even if we were to retain a comment like this, I think it should be much more
brief.  But again, I think the patch itself accomplishes all that is needed,
so no need to comment.

>  #include <sys/types.h>
>  #include <assert.h>
>  #include <errno.h>
> @@ -118,7 +143,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	char			mod[DTRACE_MODNAMELEN];
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
> -	dt_probe_t		*prp;
> +	dt_probe_t		*uprp;

I am OK with doing this renaming of variable name because you want some form
of consustency throughout this file, but I don't believe it is really needed.
This function only deals with one type of probes, identified both in the
comment and the function name as underlying probes.  So, the prp variable that
is used in many places in DTrace source code to denote a probe pointer should
not cause any confusion.

But if you want to change it, no problem.

>  	dt_uprobe_t		*upp;
>  	int			is_enabled = 0;
>  
> @@ -160,8 +185,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.fun = psp->pps_fun;
>  	pd.prb = prb;
>  
> -	prp = dt_probe_lookup(dtp, &pd);
> -	if (prp == NULL) {
> +	uprp = dt_probe_lookup(dtp, &pd);
> +	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
>  
>  		/* Get the provider for underlying probes. */
> @@ -182,12 +207,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		if (upp->tp == NULL)
>  			goto fail;
>  
> -		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
> +		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>  				      upp);
> -		if (prp == NULL)
> +		if (uprp == NULL)
>  			goto fail;
>  	} else
> -		upp = prp->prv_data;
> +		upp = uprp->prv_data;
>  
>  	switch (psp->pps_type) {
>  	case DTPPT_RETURN:
> @@ -202,7 +227,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	     */
>  	}
>  
> -	return prp;
> +	return uprp;
>  
>  fail:
>  	probe_destroy(dtp, upp);
> @@ -394,8 +419,8 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*prp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = prp->prv_data;
> +	const dt_probe_t	*uprp = pcb->pcb_probe;
> +	const dt_uprobe_t	*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  
> @@ -508,8 +533,8 @@ copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
>  static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  {
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*prp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = prp->prv_data;
> +	const dt_probe_t	*uprp = pcb->pcb_probe;
> +	const dt_uprobe_t	*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_assign = dt_irlist_label(dlp);
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
> @@ -636,9 +661,9 @@ out:
>  	return name;
>  }
>  
> -static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  {
> -	dt_uprobe_t	*upp = prp->prv_data;
> +	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
>  	FILE		*f;
>  	char		*fn;
> @@ -733,9 +758,9 @@ out:
>   * probes that didn't get created.  If the removal fails for some reason we are
>   * out of luck - fortunately it is not harmful to the system as a whole.
>   */
> -static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>  {
> -	dt_uprobe_t	*upp = prp->prv_data;
> +	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
>  
>  	if (!dt_tp_has_info(tpp))
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
