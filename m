Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E2299A94
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757623383; cv=fail; b=mGrEwuodygVc9SzOTUBSiZ4SJ4Hbd1rNvDNPnfmHdwUH3nn09Zxqo3adKaEVF63aXRSsTQGUqukxXgEFSk+427teVFuDHF3A7FZkZDw/lrk1RZSP5SZQzpqP5DLHVfNOjCvY+y2HoiY4TCj2N8t4v/rbAGwqF5V46pS9Ud0BIao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757623383; c=relaxed/simple;
	bh=q7K3Hc1iyPOq04QMYtmqU7A/NdAh9N4dszzhgy705BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QnHvI7KflnWanLqyj/xtUxonYdbL58smLTByIaLFIi8DqEISm85mH/hF6gld0AxNowNWbuQx0VPNsWt8Cm88+EJGyoworObcRHu4PIFNVcrtlDTxh5Mxqc+tPHWS+VJfa4PLE59Fg0T/mbz+JqMN/pp1FN1mrLUx3jBae3+A8D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AwlFX4L6; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cdl/p452 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AwlFX4L6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cdl/p452"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BHC97H001919
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=l3+8qNIbO27DRt4UTRYPwU8UEcLUGQ4b6/AjhGHV8gI=; b=
	AwlFX4L6QG5Cb7d/uosZjDjL66NE9hQR4px0zOqqNoeZ+OK5AdSW9e276l9xVgAY
	XD8zi9G8N6aCd5vmLlIx9kOI+Ncu87zuaKn57bsoaR/7jUZZspfU3fEiAU4lq9AY
	pXiWQiwpdOnCxrvlAvWY2ZnbvB9D4pdQjg711TdVJ/kDSfbzErhC/nrRIslaHl1r
	4vsOvt2aLPLG/HUJ7Tv5OY3xPUey8JecIvwNTC5dfh2nDaJpbPZ6opt/FzUn/AEx
	yH4MacbfJHHev2towQsgXI10v8Y8XjBDP7ynFdmEHlcJE50NcFWkcrflnyK4XlRr
	rUAnQ+0F0SX/rgB0w0nuuQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922shy0hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:43:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58BKIIG8038858
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:43:00 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdcyyrx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/2cLB7IBcbtkUjq94HNcFvBVATObo8DYZB1uFTUZ5IVQ+LMvDs47W0yYs0OEAD39GgtJCaTQLUPmAALNeaz2ff2l/jdOVaIijnP5f0Njksu45th4CbMJNM5v6EW5wjjpVX6k1p4Jqrc41ThUiqSY9SUxbaoJNBUdnRaUZdDsPk4B/GkjjHISfoVnnr9VNVD4dyrs97NIvr4oy8kkK35KqyuetTr793QgFSs0gAo7zNnCcHq5kB/MlvZ5iM0YvxnniRRsWSk0u5ydWHLP4csBvG7q+MGDD1fZYBcXkN2kT76fgInaupH2Os2M8AQXkBRu9942+O9RI2UnUaMFxxUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6K+clEbNg+wRKGvXKNwa99v/kbmI5xFRm5BbDz3/h8=;
 b=KFmxHOBGD6ijMKA8oEiqo8ClbFXXJBjBP2uLN0uvRkzqZEG9pxMC/T5EErLKzmHoDTou42+1Y/8mE8Wvazvie3rqq5Yg3Rcj9fYlbSGuvIJFQZtu5GmyluCE8X/5OqP84c1JxKlsfS+uWp5R3lqCW0OviESHC5Uu217Tlu2WClApNEQ++CnYLTfbyeNPHbl/iyqL8ici2ogzRTxULjP8R4T4BuMgjaLhdlrB9d2qmP9E+ttcg93zNQqnRw5wbRFPLxPGE2S1erUMpGmt6fdd7At8VxZp4CaKKbIWsissNGprkpeDV7OjNFa5eJGYgISS5ZcCx2QG4sw7CWjyIX3MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6K+clEbNg+wRKGvXKNwa99v/kbmI5xFRm5BbDz3/h8=;
 b=Cdl/p452KwgwUFf9tMkjYIJry3M17Bkbhj8UpjSYNhED/PnupmdT/V3VCBic9HZu54q9BYXcdTfAtyKqJq0dEpT2zgM6xU41sd44hAQz/wc4IN7Ewm+eo9MTW1yCyPqCi/IhOncFmeaBEA93QdE+mG/sFATaKsJpmH1jGunPdIk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB6481.namprd10.prod.outlook.com (2603:10b6:510:1ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 20:42:57 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 20:42:57 +0000
Date: Thu, 11 Sep 2025 16:42:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] alloca: fix subtraction of two alloca pointers
Message-ID: <aMM0TnMEQNJQARfc@oracle.com>
References: <SJ0PR10MB567210C6329527665030B8D5C205A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <ed020c9c-1d0c-8405-b8cc-969324798934@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed020c9c-1d0c-8405-b8cc-969324798934@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 7806b7a9-bb49-488e-b206-08ddf173c9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?guGl7x+0KbvZfYW1C+GsmqtNBB0ILaeQC7CNh1QBlqkZZoE1lBfWygktwr?=
 =?iso-8859-1?Q?5btOIj5U2kStyFm9fVVeWOQkUmkEpQ2IhrsVDeq23Zv6qnMY9qZpKUnVwv?=
 =?iso-8859-1?Q?kIKo4kUOFeEiT5nNVTe1h6c9tyEn9i1rsCMExFijRQhyUkTC7vHBHVPto5?=
 =?iso-8859-1?Q?+JDDSzW2tJ82shHcrr4QRtVvEleSk6/CG9pN/BUFIYPFRjfdpAjpnkwIKO?=
 =?iso-8859-1?Q?LaHxJwO/o05oHYzsIkW/VJb+8f9NE3YehjWHXMjguczUSi7LjJBHqTXRCR?=
 =?iso-8859-1?Q?morIfZ8EAfvo+ooqohxpX4Pv7PKCKEYXKN60Y+Fo9CZ6vBYTaK9LsIduAY?=
 =?iso-8859-1?Q?hkk9lskvZkGjaxeQFZIDFs9ZNOIC36zaEm+3Lsno6jymtD2NdZVgSCrjFw?=
 =?iso-8859-1?Q?iyBsrs4c87Q8TG1ksnOBupYI7t6BcbU18p12ADCRP22W8tYkiz2MkvvKqe?=
 =?iso-8859-1?Q?jg7UBWpIzTqLPwuxPHxolPv+lKLbUShEc7ypLFXiGODbUzVc8qH7AQFWVN?=
 =?iso-8859-1?Q?c0Q+UwUJfWMtliEXgnr8lsx7J5K1gkmOWh55NKc/OWFQcrtUBNRSsJLEb7?=
 =?iso-8859-1?Q?qX0RnBPjT0HGgMIlqHpPtFkTOaSCSHHX0Juv3XOP6H+5eLpsmm7E39v87+?=
 =?iso-8859-1?Q?27cg5VgW65m0UCyZLJcZx4ThLSJsqjGJfRXiq+H1Eb/790eZxOdCB98j/a?=
 =?iso-8859-1?Q?eouaRjLaqakagTNgL0OyJpp9Rgj4AuFg9HXFyS0Dl/jFUGK8dHwdMWIPRI?=
 =?iso-8859-1?Q?MiOeXNimkSGfKVmiK1h5GRDQCLAolFAxW262k7CsMLwrXOIKzSpavMAgYL?=
 =?iso-8859-1?Q?fVozNpoVgEo/l3t5Y2JVinjsr2GJ3yhjQDkvRbNJtDcIF9lbFkqKjqK+D4?=
 =?iso-8859-1?Q?+p83UGambLAcl4qx6Hr2eyKAt5CE4tPzq6SKHXCWbc9C2pASJ94d+/DrxP?=
 =?iso-8859-1?Q?RdP4IKjMCq9ZVU6B4+n/M6J/R9De4oYZ+VS1ukZStBnt92V7wIVXh+AiGG?=
 =?iso-8859-1?Q?axXl2m0UI9YwjGbo4EEqppoo78uV/ooVgCVfNMJyT5OYS1XZnZ+Mmo+60k?=
 =?iso-8859-1?Q?IWvUqNEMtV7sqbtSUWT+D8Uu5d8vP1l4hAJCJRvbUI0JRza0kOcmbkDncd?=
 =?iso-8859-1?Q?M/KBfPzCTNmhVGrI1LUlRB4NtPglmMfYbIFirog0oF57qXJWhA+THYecNt?=
 =?iso-8859-1?Q?wdTTx8ePvGiDAcKpdNi6aw4g30JQSO0cA69SN4WhtayYxJwoYfTfnnkK8W?=
 =?iso-8859-1?Q?8BQ71MlMY8QSYlAopWvnO+/9ga0PPnyln3Cu4yDQivbFdsMS4XYABVbP4H?=
 =?iso-8859-1?Q?5N7wO40BSh4gGmcT17h2yQ++IBLcPRX6znfIfgqADgo5EFTQDSidD4uBno?=
 =?iso-8859-1?Q?LoIWqW5mPMBiO+XjwZIsUWw+YVKs2CZhWspv3m7yMpJ2FWf1WpgwSXmCEd?=
 =?iso-8859-1?Q?t1KNSuS0F58XjaaSQtYGh7yKRua6RdRkwv5sVz0TuKleLACnMlH1DyjxAn?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?weFxJ3p2B4O7eMCEdcxoNKdqYHgrLtOVqSaKZ7hpX3Qx/mI+DItpScfmKP?=
 =?iso-8859-1?Q?r5b5WQt45qjLfupHIUc0+KBBYHDFomrc+S5vYmPit7eR3OsiBCfGHlJLdj?=
 =?iso-8859-1?Q?3DR4525x/nNUDRM4hMzGSUnLvSQ3twfMcNJJJJiy+zWZTMYfZHW06nzmP/?=
 =?iso-8859-1?Q?pLxvUUcnEzfZumaTe9k0giuw4Z/AyGJqxy8d5vKxKyMY52NQis5V6MYj9c?=
 =?iso-8859-1?Q?TF5ro+jYqucZPzM44dr5SKiOj/OpRGOFS+yt9wvfkMz566i26pgQDmV8Ez?=
 =?iso-8859-1?Q?/Nj+QtjTEZnP3SBWXByXaCVQzvNUZUlDksjyrCG7D2HJPURSEyrWqPiJGQ?=
 =?iso-8859-1?Q?r5RG+rnxA9vgWPM1LHyjpEVRa8QdKxooiZJaQvTDaAqN2WgBNW3dQTMxJO?=
 =?iso-8859-1?Q?u6onWhv3pKveWRIa5A9N/WwE28EPSjEnN4hFdRU6ANKBQ0fbH2W89WOANZ?=
 =?iso-8859-1?Q?7MmjfZgW1yCPS02CJDLzaSZ5R5l5i8l77kJ00rpE6FsxPPA/xi+LgUKFwz?=
 =?iso-8859-1?Q?aWL2tdps06F6r+Lfnfv+gB4tjd5q0JeJEYBkdIpofd5uyfWql/KzvVt7Y3?=
 =?iso-8859-1?Q?CQZ6M+mpJBfWWCqt9KBqhUEUHf+0+SsTAxx6qGY7wnrT2MLeg1Nk2OJq7H?=
 =?iso-8859-1?Q?kPnfEdDRP5Qeu50JJqa3cHKohiz8IMbXbMN5dm5bLGCPhjp6lvz6ke7/9H?=
 =?iso-8859-1?Q?onpj2zDK93wQkysQb4CpHqvO2mMHfKfSUQTVqaeySomTQXpD4Oq8RjkBEe?=
 =?iso-8859-1?Q?t5Ezn5r8wvWphQUNOP6CjX7Z49vGNcr0/WbXQrMliFHJjcwgcHvPAinpzU?=
 =?iso-8859-1?Q?r8GvXpbef7JLuKk4nMxwcp2Rfm/uqV4zoiLWAdfZviJZh/o6XneB28Dsnj?=
 =?iso-8859-1?Q?3/LTdoWBQF5OwHm3eXZNBpzGgLBC8V70bHjo1g18XghTqOTw9zcsLE3si5?=
 =?iso-8859-1?Q?lUpnl28FeSOY+mlytpAqjy7FJ2sTYcAazpG9ZnZT1LlFEx/4+IT1nWJbAs?=
 =?iso-8859-1?Q?EOWoxnLaJ6CqQU5thlOymqo8FC/3RLzhHJcAL7reIAkzFeNZlZtODkiYk+?=
 =?iso-8859-1?Q?lXRBAnBwQg0nQyvoU35IJmiS8N+03zgm3Ep7Wni3iQnU3cEvksu8F4NLdP?=
 =?iso-8859-1?Q?UwXrTn0iz928YGXbclW8W1lUWuM62fPmg726VPOAmOZu6LALt8KNjqV6DA?=
 =?iso-8859-1?Q?OtdQ0/VWeeAiYNtpxKzpsnJWZQqswY1JnujJ37CGvr7elM0+lnYer58x+g?=
 =?iso-8859-1?Q?IS/38sfGC1i+fQBnBt6ICfhNk/713VJa2viyD9WhYVzs85SrCsa1b/uZim?=
 =?iso-8859-1?Q?fR0YOqux0R/9xKsJ7SFU3t0G7lfWPL6jUQQY+CtR7oui6vyQBn3FSzXqy7?=
 =?iso-8859-1?Q?DXAG5nmKvvUGmq6dtFymMiuvdM5CNSkHe8jDsSb5L4usD+rHBK1Ezqy+JK?=
 =?iso-8859-1?Q?GhLZdrHMUZflMVEPq1bCQwdzaT3wVioY+qJ2N2ANelqwG4+cgI01LI+j2r?=
 =?iso-8859-1?Q?n6tgher/+RI8eBQFE1w1HowTiEHsv9kp7AmI5k/TCnl/Z4BRQhoUn4d4yj?=
 =?iso-8859-1?Q?5vTx+bvlY4Jhft1OFnRr4xFX00g7CnjZCKW+SuM9Foq3Zp/erkgSSitKmI?=
 =?iso-8859-1?Q?gIUK4CBp8D3fHtlfKzQnERHYvEDQqKfzIEAisT5lVyyMnK64eg3DIO1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9koJYX6OKrqlsZeL4gomDvlO9UiG8oeJm4LObrKP08onHT31V/Gkc9IlvvjFSs/DikPmn0bT37+yT3fjjoZjZSJGrpwMQzWC0uGnD2y+KM4JSIJe6ht38vi0GEgYvBEBx+IXFF3oSspODu3TIZFZmVFSQ5OXJ3gK78ADiEKFvrAzjT32FaGTid0LOD2ZzY62HsEFlMGlbj4iCxi+EYUOXk062MDGIa5cNu2tjNpaY4rKLQbZlaCe2+/P32wfVXkygcslESWzB7IAr7/yTqS5MhFtphIXVDQbBVsxm6SXW1OyC96hqa9dGm8xRnzVNvVkHRQEKWMKsBgeHXXreixXnmRpI00EkAw7XZRqZuBV1cZOm7AMeDGvgM0AIt0pd+eRsVVANCR5gU5ZGQCYU5ctWo0+5sHk0v69wztfqTbQqpL22k8fanIx9nz8RsTfO3bOI2ARLv2OrbpbdvAsJ2BNIRhLRfc9uPBcPZq/pRWeLew2RxdMcWf1ks+SPeiEnBA52TlEXy2nBb57B7f9d6Klkcc93uiGeKFsJUd3IMBSAT86xzpWzl8HAyCM842HGlStSNrpfKKX98vAuVjguh6EyWWa+QECJei+5DSXYWkoZKA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7806b7a9-bb49-488e-b206-08ddf173c9e9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 20:42:56.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4P0sYuBFRp+rn+W3BH2D2SeUtwGVuXFAUkM8q94doHXbSD9g//olAJtA9+d8SQfCLqkWBig2eF8jHPypUXeCBrUb7dc8oyfZ5cDSHRQt80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6481
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509110186
X-Authority-Analysis: v=2.4 cv=esTfzppX c=1 sm=1 tr=0 ts=68c33454 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3rT1jr6sTKrN1LntCBUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NSBTYWx0ZWRfX6QmiRqOZ1YPj
 0QMqLFUWOPsun9T/IlJVjGoeTu8bo94j2B2gJ3d9G/otF1zt/+/MEPbCjfU8ecanviXvp0QEhe6
 5z5ZckWrbpJKevlcj9LqzDCOHp5Df94Lk8jAz3XsefWPcxARjcn5CjhnHnjXVfeUkmvfKY4eWAY
 pbnfZ4XM0BkqPim1p2r5SAgtquJSw3lLxGPsjN/rIDR9adaA5sNInaPO2DZNISSab/eMhnMgBrd
 u1cqYilO1hTZprfeHld81ApDXIcXv6XhHWv0xRjCBtn1xA8WhClBL3wzO1Jn78PUNLmH0FcYEMF
 ietztjuyqgPe9l6oyX4f21xvEsfu1cEWw+lb3c/fnYUciabpqzBuLirlPHhAouubm0SGzIR2aKg
 GJI332xf1JYsuoUX/bJGwQgE8OCEjg==
X-Proofpoint-GUID: _v_GmNCLOzDWlFJWnZBnRYUAsbS1-sXU
X-Proofpoint-ORIG-GUID: _v_GmNCLOzDWlFJWnZBnRYUAsbS1-sXU

On Mon, Sep 01, 2025 at 01:13:49PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Thanks.

> though...
> 
> On 8/30/25 01:55, Kris Van Hees wrote:
> > diff --git a/test/unittest/funcs/alloca/tst.alloca-arith.d b/test/unittest/funcs/alloca/tst.alloca-arith.d
> > @@ -0,0 +1,29 @@
> > +BEGIN
> > +{
> > +	x = (char *)alloca(1);
> 
> This is okay, but is it dead, vestigial code?

No, it is part of the logic used here and in other tests to ensure that the
alloca mgmt code ensures proper alignment.
> 
> > +	x = (char *)alloca(10);
> > +	y = (char *)alloca(1);
> > +	z = y - x;
> > +	z /= 8;
> 
> This is okay, but how about skipping the /8 and just testing for 16?  If
> you're worried about padding changes in the future(?), then the x alloca()
> could become alloca(16).

Same as above... part of the logic to also verify that alignment is done
right.  In this case, it matters in terms of the pointer subtraction code
which uses the base type size to make the subtraction give the number of
element between the two pointers rather than just bytes.

> > +	exit(z == 2 ? 0 : 1);
> > +}
